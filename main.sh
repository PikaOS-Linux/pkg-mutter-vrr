DEBIAN_FRONTEND=noninteractive

# Clone Upstream
git clone mutter-vrr https://gitlab.gnome.org/GNOME/mutter -b 44.2
cd ./mutter-vrr
patch -Np1 -i debian/meson-add-back-default_driver-option.patch
patch -Np1 -i tests-Mark-view-verification-tests-as-incomplete-in-big-e.patch

# Get build deps
apt-get build-dep ./ -y

# Build package
LOGNAME=root dh_make --createorig -y -l -p mutter-vrr_44.2 || true
cp -rvf ./debian ./mutter-vrr
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
