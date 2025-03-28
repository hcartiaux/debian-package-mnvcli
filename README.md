```
$ make deb
# Build the package
dpkg-buildpackage -b -us -uc
dpkg-buildpackage: info: source package mnvcli
dpkg-buildpackage: info: source version 1.0.13.1061-1
dpkg-buildpackage: info: source distribution unstable
dpkg-buildpackage: info: source changed by Hyacinthe Cartiaux <hyacinthe.cartiaux@uni.lu>
dpkg-buildpackage: info: host architecture amd64
 dpkg-source --before-build .
 fakeroot debian/rules clean
make[1]: Entering directory '/home/hcartiaux/debian-package-mnvcli'
dh clean --max-parallel=1
   dh_auto_clean -O--max-parallel=1
   dh_autoreconf_clean -O--max-parallel=1
   dh_clean -O--max-parallel=1
make[1]: Leaving directory '/home/hcartiaux/debian-package-mnvcli'
 debian/rules build
make[1]: Entering directory '/home/hcartiaux/debian-package-mnvcli'
dh build --max-parallel=1
   dh_update_autotools_config -O--max-parallel=1
   dh_autoreconf -O--max-parallel=1
   dh_auto_configure -O--max-parallel=1
   dh_auto_build -O--max-parallel=1
        make -j1
make[2]: Entering directory '/home/hcartiaux/debian-package-mnvcli'
# Taken from https://www.dell.com/support/home/en-us/drivers/driversdetails?driverid=ggx26
wget --user-agent="firefox" "https://dl.dell.com/FOLDER12268461M/1/BOSS-ROR-N1_Linux_CLI_1.0.13.1061_A03.zip"
wget --user-agent="firefox" "https://dl.dell.com/FOLDER12593000M/1/BOSS-ROR-N1_Linux_RelNotes_1.0.13.1061_A03.txt"
sha256sum -c sha256sums
--2025-03-28 19:26:48--  https://dl.dell.com/FOLDER12268461M/1/BOSS-ROR-N1_Linux_CLI_1.0.13.1061_A03.zip
Resolving dl.dell.com (dl.dell.com)... 23.200.87.216, 23.200.87.187, 2a02:26f0:82::17d2:f951, ...
Connecting to dl.dell.com (dl.dell.com)|23.200.87.216|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 824554 (805K) [application/zip]
Saving to: ‘BOSS-ROR-N1_Linux_CLI_1.0.13.1061_A03.zip’

BOSS-ROR-N1_Linux_CLI_1.0.13.1061_A03.zip            100%[=====================================================================================================================>] 805.23K  4.02MB/s    in 0.2s    

2025-03-28 19:26:48 (4.02 MB/s) - ‘BOSS-ROR-N1_Linux_CLI_1.0.13.1061_A03.zip’ saved [824554/824554]

--2025-03-28 19:26:48--  https://dl.dell.com/FOLDER12593000M/1/BOSS-ROR-N1_Linux_RelNotes_1.0.13.1061_A03.txt
Resolving dl.dell.com (dl.dell.com)... 23.200.87.216, 23.200.87.187, 2a02:26f0:82::17d2:f951, ...
Connecting to dl.dell.com (dl.dell.com)|23.200.87.216|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 651 [text/plain]
Saving to: ‘BOSS-ROR-N1_Linux_RelNotes_1.0.13.1061_A03.txt’

BOSS-ROR-N1_Linux_RelNotes_1.0.13.1061_A03.txt       100%[=====================================================================================================================>]     651  --.-KB/s    in 0s      

2025-03-28 19:26:48 (35.2 MB/s) - ‘BOSS-ROR-N1_Linux_RelNotes_1.0.13.1061_A03.txt’ saved [651/651]

BOSS-ROR-N1_Linux_CLI_1.0.13.1061_A03.zip: OK
BOSS-ROR-N1_Linux_RelNotes_1.0.13.1061_A03.txt: OK
# Unzip and move files
unzip -f *.zip
rm -f *.zip
mkdir -p debian/upstream
mv -f *.txt debian/upstream/README
Archive:  BOSS-ROR-N1_Linux_CLI_1.0.13.1061_A03.zip
make[2]: Leaving directory '/home/hcartiaux/debian-package-mnvcli'
   dh_auto_test -O--max-parallel=1
   create-stamp debian/debhelper-build-stamp
make[1]: Leaving directory '/home/hcartiaux/debian-package-mnvcli'
 fakeroot debian/rules binary
make[1]: Entering directory '/home/hcartiaux/debian-package-mnvcli'
dh binary --max-parallel=1
   dh_testroot -O--max-parallel=1
   dh_prep -O--max-parallel=1
   dh_auto_install -O--max-parallel=1
   dh_install -O--max-parallel=1
   dh_installdocs -O--max-parallel=1
   dh_installchangelogs -O--max-parallel=1
   dh_systemd_enable -O--max-parallel=1
   dh_installinit -O--max-parallel=1
   dh_systemd_start -O--max-parallel=1
   dh_perl -O--max-parallel=1
   dh_link -O--max-parallel=1
   dh_strip_nondeterminism -O--max-parallel=1
   dh_compress -O--max-parallel=1
   dh_fixperms -O--max-parallel=1
   dh_missing -O--max-parallel=1
   dh_strip -O--max-parallel=1
   dh_makeshlibs -O--max-parallel=1
   dh_shlibdeps -O--max-parallel=1
   dh_installdeb -O--max-parallel=1
   dh_gencontrol -O--max-parallel=1
   dh_md5sums -O--max-parallel=1
   dh_builddeb -O--max-parallel=1
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

