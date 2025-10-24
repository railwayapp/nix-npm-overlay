import {
  format,
  maxSatisfying,
  parse,
  parseRange,
  SemVer,
} from "https://deno.land/std@0.194.0/semver/mod.ts";

type Versions = Record<
  string,
  {
    dist: {
      tarball: string;
      integrity: string;
    };
  }
>;

export async function getLatestVersion(packageName: string, condition: string) {
  const registry = await fetch(
    `https://registry.npmjs.org/${packageName}`
  ).then((res) => res.json());

  const range = parseRange(condition);
  const versions = registry.versions as Versions;
  const semverVersions = Object.keys(versions)
    .map((v) => {
      try {
        return parse(v);
      } catch {
        return null;
      }
    })
    .filter((v): v is SemVer => v !== null && v.prerelease.length === 0);

  const latest = maxSatisfying(semverVersions, range);

  if (!latest) {
    throw new Error(
      `Couldn't find a version of ${packageName} that satisfies ${condition}`
    );
  }

  const version = format(latest);

  return {
    version,
    url: versions[version].dist.tarball,
    sha512: versions[version].dist.integrity.slice("sha512-".length),
  };
}
