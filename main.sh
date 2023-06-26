DEBIAN_FRONTEND=noninteractive

# Clone Upstream
git clone mutter-vrr https://gitlab.gnome.org/GNOME/mutter -b 44.2
cd ./mutter-vrr

# Get build deps
apt-get build-dep ./ -y

# Build package
LOGNAME=root dh_make --createorig -y -l -p mutter-vrr_44.2 || true
cp -rvf ./debian ./mutter-vrr
dpkg-buildpackage

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
