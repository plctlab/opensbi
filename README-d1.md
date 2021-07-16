# How to test

## 1. get the official source code

Please refer to  [https://d1.docs.allwinnertech.com/study/study_2getsdk/](https://d1.docs.allwinnertech.com/study/study_2getsdk/)

## 2. build the official image

Please refer to [https://d1.docs.allwinnertech.com/study/study_4compile/](https://d1.docs.allwinnertech.com/study/study_4compile/)

## 3. replace opensbi in the official source code

Switch to the root directory of the official source code, and then execute the following command

```shell
cd lichee/brandy-2.0/
rm -rf opensbi
git clone -b d1 git@github.com:plctlab/opensbi.git
```

## 4. build opensbi

Switch to the root directory of the official source code, and then execute the following command

```shell
cd lichee/brandy-2.0/opensbi/
rm -rf build
make CROSS_COMPILE=$(pwd)/../tools/toolchain/riscv64-linux-x86_64-20200528/bin/riscv64-unknown-linux-gnu- PLATFORM=thead/c910 PLATFORM_RISCV_ISA=rv64gcxthead SUNXI_CHIP=sun20iw1p1
cp build/platform/thead/c910/firmware/fw_jump.bin ../../../device/config/chips/d1/bin/opensbi_sun20iw1p1.bin
cd -
```

## 5. generate image file

```bash
source build/envsetup.sh
lunch d1_nezha-tina
pack
```

## 6. Burn to the board and test

Please refer to [https://d1.docs.allwinnertech.com/study/study_4compile/](https://d1.docs.allwinnertech.com/study/study_4compile/)
