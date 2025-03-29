# `MNVCLI` debian package

`MNVCLI` is a tool to query and manipulate `BOSS-N1` raid controllers found in Dell servers.
It is distributed as a binary in a ZIP file on the Dell website.

It is documented partially [in this manual](https://www.dell.com/support/manuals/en-us/boss-s-1/boss-n1_ug/boss-n1-cli-commands-supported-on-poweredge-servers?guid=guid-cc571bf6-65c3-4b72-bb65-8f873ea74de2).

## Release

Packages are built and released using a [github action](https://github.com/hcartiaux/debian-package-mnvcli/actions) triggered manually.
For each [release](https://github.com/hcartiaux/debian-package-mnvcli/releases), a Debian package is attached with its sha256sum.

## Update

1. Find the new version URL on dell.com, [in example here](https://www.dell.com/support/home/en-us/drivers/driversdetails?driverid=ggx26)
2. Update the URL of the application and release notes in the Makefile
3. Update the file `sha256sums`
4. Add an entry in the `changelog` with the command `dch -i changelog`

## Makefile usage

```
$ make deb
# Build the package
dpkg-buildpackage -b -us -uc
dpkg-buildpackage: info: source package mnvcli
dpkg-buildpackage: info: source version 1.0.13.1061-1
dpkg-buildpackage: info: source distribution unstable
dpkg-buildpackage: info: source changed by Hyacinthe Cartiaux <hyacinthe.cartiaux@uni.lu>
dpkg-buildpackage: info: host architecture amd64
...
dpkg-deb: building package 'mnvcli' in '../mnvcli_1.0.13.1061-1_amd64.deb'.
dpkg-deb: building package 'mnvcli-dbgsym' in '../mnvcli-dbgsym_1.0.13.1061-1_amd64.deb'.
make[1]: Leaving directory '/home/hcartiaux/debian-package-mnvcli'
 dpkg-genbuildinfo --build=binary
 dpkg-genchanges --build=binary >../mnvcli_1.0.13.1061-1_amd64.changes
dpkg-genchanges: info: binary-only upload (no source code included)
 dpkg-source --after-build .
dpkg-buildpackage: info: binary-only upload (no source included)

$ ls ..
debian-package-mnvcli/  mnvcli_1.0.13.1061-1_amd64.buildinfo  mnvcli_1.0.13.1061-1_amd64.changes  mnvcli_1.0.13.1061-1_amd64.deb  mnvcli-dbgsym_1.0.13.1061-1_amd64.deb
```

## `mnv_cli` usage

```
./mnv_cli info -o vd

VD ID:               0
Name:                VD_0
Status:              Functional
Importable:          No
RAID Mode:           RAID1
size:                447 GB
PD Count:            2
PDs:                 0 1
Stripe Block Size:   128K
Sector Size:         512 bytes
VD is secure:        No

Total # of VD:       1
```

