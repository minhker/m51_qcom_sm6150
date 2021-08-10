# SPDX-License-Identifier: GPL-2.0
ifeq ($(TARGET_BOARD_TYPE),auto)
ifeq ($(CONFIG_BUILD_ARM64_DT_OVERLAY),y)
	dtbo-$(CONFIG_ARCH_SM6150) += \
		sa6155-adp-star-overlay.dtbo \
		sa6155p-adp-star-overlay.dtbo \
		sa6155p-adp-star-lpass-overlay.dtbo \
		sa6155-adp-air-overlay.dtbo \
		sa6155p-adp-air-overlay.dtbo \
		sa6155p-v2-adp-star-overlay.dtbo \
		sa6155p-v2-adp-air-overlay.dtbo \
		sa6155p-v2-adp-air-lpass-overlay.dtbo \
		sa6155p-v2-adp-air-lxc-overlay.dtbo

sa6155-adp-star-overlay.dtbo-base := sa6155.dtb
sa6155p-adp-star-overlay.dtbo-base := sa6155p.dtb
sa6155p-adp-star-lpass-overlay.dtbo-base :=sa6155p.dtb
sa6155p-v2-adp-star-overlay.dtbo-base := sa6155p.dtb
sa6155-adp-air-overlay.dtbo-base := sa6155.dtb
sa6155p-adp-air-overlay.dtbo-base := sa6155p.dtb
sa6155p-v2-adp-air-overlay.dtbo-base := sa6155p.dtb
sa6155p-v2-adp-air-lpass-overlay.dtbo-base := sa6155p.dtb
sa6155p-v2-adp-air-lxc-overlay.dtbo-base := sa6155p.dtb
else
dtb-$(CONFIG_ARCH_SM6150)	+= sa6155-adp-star.dtb \
	sa6155p-adp-star.dtb \
	sa6155p-adp-star-lpass.dtb \
	sa6155-adp-air.dtb \
	sa6155p-adp-air.dtb \
	sa6155p-v2-adp-star.dtb \
	sa6155p-v2-adp-air.dtb \
	sa6155p-v2-adp-air-lpass.dtb

endif

else # TARGET_BOARD_TYPE != auto

dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc.dtb
dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk01.dtb
dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-mtp.dtb
dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-bullhead-rev-101.dtb
dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-angler-rev-101.dtb
dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-mtp.dtb
ifeq ($(CONFIG_BUILD_ARM64_DT_OVERLAY),y)
	dtbo-$(CONFIG_ARCH_SM6150) += \
		sm6150-rumi-overlay.dtbo \
		sm6150-qrd-overlay.dtbo \
		sm6150-idp-overlay.dtbo \
		sm6150p-qrd-overlay.dtbo \
		sm6150p-idp-overlay.dtbo \
		sm6150-external-codec-idp-overlay.dtbo \
		sm6150-usbc-idp-overlay.dtbo \
		sm6150-usbc-minidp-idp-overlay.dtbo \
		sm6150-cmd-mode-display-idp-overlay.dtbo \
		sa6155-adp-star-overlay.dtbo \
		sa6155p-adp-star-overlay.dtbo \
		sa6155-adp-air-overlay.dtbo \
		sa6155p-adp-air-overlay.dtbo \
		sa6155p-v2-adp-star-overlay.dtbo \
		sa6155p-v2-adp-air-overlay.dtbo \
		qcs610-iot-overlay.dtbo \
		qcs610-ipc-overlay.dtbo \
		qcs410-iot-overlay.dtbo \
		prairie-iot-idp-overlay.dtbo \
		prairie-iot-external-codec-idp-overlay.dtbo \
		prairie-iot-usbc-idp-overlay.dtbo \
		prairie-iot-cmd-mone-display-idp-overlay.dtbo \
		prairie-iot-usbc-minidp-idp-overlay.dtbo

sm6150-rumi-overlay.dtbo-base := sm6150.dtb
sm6150-qrd-overlay.dtbo-base := sm6150.dtb
sm6150-idp-overlay.dtbo-base := sm6150.dtb
sm6150p-qrd-overlay.dtbo-base := sm6150p.dtb
sm6150p-idp-overlay.dtbo-base := sm6150p.dtb
sm6150-external-codec-idp-overlay.dtbo-base := sm6150.dtb
sm6150-usbc-idp-overlay.dtbo-base := sm6150.dtb
sm6150-usbc-minidp-idp-overlay.dtbo-base := sm6150.dtb
sm6150-cmd-mode-display-idp-overlay.dtbo-base := sm6150.dtb
sa6155-adp-star-overlay.dtbo-base := sa6155.dtb
sa6155p-adp-star-overlay.dtbo-base := sa6155p.dtb
sa6155p-v2-adp-star-overlay.dtbo-base := sa6155p.dtb
sa6155-adp-air-overlay.dtbo-base := sa6155.dtb
sa6155p-adp-air-overlay.dtbo-base := sa6155p.dtb
sa6155p-v2-adp-air-overlay.dtbo-base := sa6155p.dtb
qcs610-iot-overlay.dtbo-base := qcs610.dtb
qcs610-ipc-overlay.dtbo-base := qcs610.dtb
qcs410-iot-overlay.dtbo-base := qcs410.dtb
prairie-iot-idp-overlay.dtbo-base := qcs610.dtb
prairie-iot-external-codec-idp-overlay.dtbo-base := qcs610.dtb
prairie-iot-usbc-idp-overlay.dtbo-base := qcs610.dtb
prairie-iot-cmd-mode-display-idp-overlay.dtbo-base := qcs610.dtb
prairie-iot-usbc-minidp-idp-overlay.dtbo-base := qcs610.dtb
else
dtb-$(CONFIG_ARCH_SM6150)	+= sm6150-rumi.dtb \
	sm6150-qrd.dtb \
	sm6150-idp.dtb \
	sm6150p-qrd.dtb \
	sm6150p-idp.dtb \
	sm6150-external-codec-idp.dtb \
	sm6150-usbc-idp.dtb \
	sm6150-usbc-minidp-idp.dtb \
	sm6150-cmd-mode-display-idp.dtb \
	sa6155-adp-star.dtb \
	sa6155p-adp-star.dtb \
	sa6155-adp-air.dtb \
	sa6155p-adp-air.dtb \
	sa6155p-v2-adp-star.dtb \
	sa6155p-v2-adp-air.dtb \
	qcs610-iot.dtb \
	qcs610-ipc.dtb \
	qcs410-iot.dtb \
	prairie-iot-idp.dtb \
	prairie-iot-external-codec-idp.dtb \
	prairie-iot-usbc-idp.dtb \
	prairie-iot-cmd-mode-display-idp.dtb \
	prairie-iot-usbc-minidp-idp.dtb

endif

ifeq ($(CONFIG_BUILD_ARM64_DT_OVERLAY),y)
	dtbo-$(CONFIG_ARCH_SDMMAGPIE) += \
		sdmmagpie-idp-overlay.dtbo \
		sdmmagpie-atp-overlay.dtbo \
		sdmmagpie-rumi-overlay.dtbo \
		sdmmagpie-qrd-overlay.dtbo \
		sdmmagpiep-idp-overlay.dtbo \
		sdmmagpiep-atp-overlay.dtbo \
		sdmmagpiep-qrd-overlay.dtbo \
		sdmmagpie-external-codec-idp-overlay.dtbo \
		sdmmagpie-usbc-idp-overlay.dtbo \
		sdmmagpie-dual-display-idp-overlay.dtbo

sdmmagpie-idp-overlay.dtbo-base := sdmmagpie.dtb
sdmmagpie-atp-overlay.dtbo-base := sdmmagpie.dtb
sdmmagpie-rumi-overlay.dtbo-base := sdmmagpie.dtb
sdmmagpie-qrd-overlay.dtbo-base := sdmmagpie.dtb
sdmmagpiep-idp-overlay.dtbo-base := sdmmagpiep.dtb
sdmmagpiep-atp-overlay.dtbo-base := sdmmagpiep.dtb
sdmmagpiep-qrd-overlay.dtbo-base := sdmmagpiep.dtb
sdmmagpie-external-codec-idp-overlay.dtbo-base := sdmmagpie.dtb
sdmmagpie-usbc-idp-overlay.dtbo-base := sdmmagpie.dtb
sdmmagpie-dual-display-idp-overlay.dtbo-base := sdmmagpie.dtb
else
dtb-$(CONFIG_ARCH_SDMMAGPIE)	+= sdmmagpie-rumi.dtb \
	sdmmagpie-idp.dtb \
	sdmmagpie-atp.dtb \
	sdmmagpie-qrd.dtb \
	sdmmagpiep-idp.dtb \
	sdmmagpiep-atp.dtb \
	sdmmagpiep-qrd.dtb \
	sdmmagpie-external-codec-idp.dtb \
	sdmmagpie-usbc-idp.dtb \
	sdmmagpie-dual-display-idp.dtb
endif
endif

ifeq ($(CONFIG_ARM64),y)
always		:= $(dtb-y)
subdir-y	:= $(dts-dirs)
else
targets += dtbs
targets += $(addprefix ../, $(dtb-y))

$(obj)/../%.dtb: $(src)/%.dts FORCE
	$(call if_changed_dep,dtc)

ifeq ($(CONFIG_BUILD_ARM64_DT_OVERLAY),y)
$(obj)/%.dtbo:$(src)/../../../../arm64/boot/dts/qcom/%.dts FORCE
	$(call if_changed_dep,dtc)
	$(call if_changed,dtbo_verify)

dtbs: $(addprefix $(obj)/,$(dtb-y)) $(addprefix $(obj)/,$(dtbo-y))
else
dtbs: $(addprefix $(obj)/../,$(dtb-y))
endif
endif
clean-files	:= *.dtb *.dtbo
