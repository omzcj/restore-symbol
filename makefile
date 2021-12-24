
.PHONY:restore-symbol

TMP_FILE := libMachObjC.a restore-symbol.dSYM/ build/ class-dump/build/

restore-symbol: 
	rm -rf $(TMP_FILE) 
	rm -f restore-symbol
	rm -rf class-dump
	git clone https://github.com/omzcj/class-dump
	xcodebuild -project "restore-symbol.xcodeproj" -target "restore-symbol" -configuration "Release" CONFIGURATION_BUILD_DIR="$(shell pwd)" -jobs 4 build
	rm -rf $(TMP_FILE)
	

clean:
	rm -rf restore-symbol $(TMP_FILE)

