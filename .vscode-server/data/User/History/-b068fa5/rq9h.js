// just pre-load all the stuff that index.js lazily exports
const internalRe = require('semver/internal/re')
const constants = require('semver/internal/constants')
const SemVer = require('semver/classes/semver')
const identifiers = require('semver/internal/identifiers')
const parse = require('semver/functions/parse')
const valid = require('semver/functions/valid')
const clean = require('semver/functions/clean')
const inc = require('semver/functions/inc')
const diff = require('semver/functions/diff')
const major = require('semver/functions/major')
const minor = require('semver/functions/minor')
const patch = require('semver/functions/patch')
const prerelease = require('semver/functions/prerelease')
const compare = require('semver/functions/compare')
const rcompare = require('semver/functions/rcompare')
const compareLoose = require('semver/functions/compare-loose')
const compareBuild = require('semver/functions/compare-build')
const sort = require('semver/functions/sort')
const rsort = require('semver/functions/rsort')
const gt = require('semver/functions/gt')
const lt = require('semver/functions/lt')
const eq = require('semver/functions/eq')
const neq = require('semver/functions/neq')
const gte = require('semver/functions/gte')
const lte = require('semver/functions/lte')
const cmp = require('semver/functions/cmp')
const coerce = require('semver/functions/coerce')
const Comparator = require('semver/classes/comparator')
const Range = require('semver/classes/range')
const satisfies = require('semver/functions/satisfies')
const toComparators = require('semver/ranges/to-comparators')
const maxSatisfying = require('semver/ranges/max-satisfying')
const minSatisfying = require('semver/ranges/min-satisfying')
const minVersion = require('semver/ranges/min-version')
const validRange = require('semver/ranges/valid')
const outside = require('semver/ranges/outside')
const gtr = require('semver/ranges/gtr')
const ltr = require('semver/ranges/ltr')
const intersects = require('semver/ranges/intersects')
const simplifyRange = require('semver/ranges/simplify')
const subset = require('semver/ranges/subset')
module.exports = {
  parse,
  valid,
  clean,
  inc,
  diff,
  major,
  minor,
  patch,
  prerelease,
  compare,
  rcompare,
  compareLoose,
  compareBuild,
  sort,
  rsort,
  gt,
  lt,
  eq,
  neq,
  gte,
  lte,
  cmp,
  coerce,
  Comparator,
  Range,
  satisfies,
  toComparators,
  maxSatisfying,
  minSatisfying,
  minVersion,
  validRange,
  outside,
  gtr,
  ltr,
  intersects,
  simplifyRange,
  subset,
  SemVer,
  re: internalRe.re,
  src: internalRe.src,
  tokens: internalRe.t,
  SEMVER_SPEC_VERSION: constants.SEMVER_SPEC_VERSION,
  RELEASE_TYPES: constants.RELEASE_TYPES,
  compareIdentifiers: identifiers.compareIdentifiers,
  rcompareIdentifiers: identifiers.rcompareIdentifiers,
}
