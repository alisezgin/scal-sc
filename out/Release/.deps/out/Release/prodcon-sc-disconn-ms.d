cmd_out/Release/prodcon-sc-disconn-ms := g++ -Wl,--as-needed  -o out/Release/prodcon-sc-disconn-ms -Wl,--start-group out/Release/obj.target/libscal.a out/Release/obj.target/libprodcon-base.a out/Release/obj.target/libsc-disconn-ms.a -Wl,--end-group -lpthread -lgflags
