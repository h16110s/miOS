#include  <Uefi.h>
#include  <Library/UefiLib.h>


// 通常エントリポイントはmain()であるがEDKIIでは自由にエントリポイント名を変更することが可能
// 設定場所はLoader.inf
EFI_STATUS EFIAPI UefiMain(
    EFI_HANDLE image_handle,
    EFI_SYSTEM_TABLE *system_table) {

  // UEFIではワイド文字 (L) にする必要がある
  Print(L"Hello, Mi World!\n");
  while (1);
  return EFI_SUCCESS;
}