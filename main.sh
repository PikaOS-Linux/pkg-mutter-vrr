DEBIAN_FRONTEND=noninteractive

# Clone Upstream
git clone https://gitlab.gnome.org/GNOME/mutter -b 43.0
mv ./mutter ./mutter-vrr
cp -rvf ./debian ./mutter-vrr
cd ./mutter-vrr

# Get build deps
apt-get build-dep ./ -y

# Build package
LOGNAME=root dh_make --createorig -y -l -p mutter-vrr_43.0
dpkg-buildpackage

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
