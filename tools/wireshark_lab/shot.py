import subprocess, time, sys, os
os.environ["DISPLAY"] = ":99"
X0, Y0 = 334, 16   # 상세 창 첫 줄 y, 줄 높이
def sh(*a): subprocess.run(a, check=False)
def shot(out, pcap, filt=None, pkt=None, actions=(), crop=None, w=1200, h=860, upper=190, lower=440, byteview=True):
    sh("pkill", "-x", "wireshark"); time.sleep(0.8)
    global X0
    open(os.path.expanduser("~/.config/wireshark/recent"), "w").write(
        f"gui.geometry_main_upper_pane: {upper}\ngui.geometry_main_lower_pane: {lower}\n"
        f"gui.packet_list_show: TRUE\ngui.tree_view_show: TRUE\ngui.byte_view_show: {'TRUE' if byteview else 'FALSE'}\n")
    X0 = 92 + upper + 12
    args = ["wireshark", "-r", pcap]
    if filt: args += ["-Y", filt]
    if pkt: args += ["-g", str(pkt)]
    subprocess.Popen(args, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    win = None
    for _ in range(40):
        time.sleep(0.4)
        r = subprocess.run(["xdotool", "search", "--onlyvisible", "--name", os.path.basename(pcap)], capture_output=True, text=True).stdout.split()
        if r: win = r[0]; break
    time.sleep(1.5)
    sh("xdotool", "windowmove", win, "0", "0"); sh("xdotool", "windowsize", win, str(w), str(h)); time.sleep(1.0)
    for a in actions:
        if a[0] == "row": sh("xdotool", "mousemove", "300", str(X0 + Y0*a[1] + 8), "click", "1")
        elif a[0] == "key": sh("xdotool", "key", *a[1:])
        elif a[0] == "down": sh("xdotool", "key", "--repeat", str(a[1]), "Down")
        elif a[0] == "list": sh("xdotool", "mousemove", "300", str(a[1]), "click", "1")
        elif a[0] == "sleep": time.sleep(a[1])
        time.sleep(0.35)
    time.sleep(0.8)
    geo = crop or f"{w}x{h}+0+0"
    sh("import", "-window", "root", "-crop", geo, out)
    sh("pkill", "-x", "wireshark")
