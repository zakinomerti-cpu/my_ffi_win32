__declspec(dllimport) void __stdcall  ExitProcess(int);
__declspec(dllimport) void* __stdcall LoadLibraryA(const char*);
extern void* _stdcall Callf(void*, const char*, int, void**);

#define CDECL	0
#define STDCALL	1

int entry() {
	void* h = LoadLibraryA("user32.dll");

	int argc = 4;
	void* argv[] = {0, "hello", "world", 0};
	Callf(h, "MessageBoxA", argc, argv);

	ExitProcess(0);
}