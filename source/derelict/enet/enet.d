/*
 * Copyright (c) 2013 Derelict Developers
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met:
 *
 * * Redistributions of source code must retain the above copyright
 *   notice, this list of conditions and the following disclaimer.
 *
 * * Redistributions in binary form must reproduce the above copyright
 *   notice, this list of conditions and the following disclaimer in the
 *   documentation and/or other materials provided with the distribution.
 *
 * * Neither the names 'Derelict', 'DerelictILUT', nor the names of its contributors
 *   may be used to endorse or promote products derived from this software
 *   without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
 * TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
module derelict.enet.enet;

public
{
    import derelict.enet.types;
    import derelict.enet.funcs;
}

private
{
    import derelict.util.loader;

    version(darwin)
        version = MacOSX;
    version(OSX)
        version = MacOSX;
}

private
{
    import derelict.util.loader;
    import derelict.util.system;

    static if(Derelict_OS_Windows)
        enum libNames = "libenet.dll, enet.dll";    
    else static if (Derelict_OS_Mac)
        enum libNames = "libenet.dylib";
    else static if (Derelict_OS_Linux)
        enum libNames = "libenet.so";
    else
        static assert(0, "Need to implement ENet libNames for this operating system.");
}

class DerelictENetLoader : SharedLibLoader
{

    protected
    {
        override void loadSymbols()
        {
            bindFunc(cast(void**)&enet_initialize, "enet_initialize");
            bindFunc(cast(void**)&enet_initialize_with_callbacks, "enet_initialize_with_callbacks");
            bindFunc(cast(void**)&enet_deinitialize, "enet_deinitialize");
            bindFunc(cast(void**)&enet_linked_version, "enet_linked_version");
            bindFunc(cast(void**)&enet_time_get, "enet_time_get");
            bindFunc(cast(void**)&enet_socket_create, "enet_socket_create");
            bindFunc(cast(void**)&enet_socket_bind, "enet_socket_bind");
            bindFunc(cast(void**)&enet_socket_get_address, "enet_socket_get_address");
            bindFunc(cast(void**)&enet_socket_listen, "enet_socket_listen");
            bindFunc(cast(void**)&enet_socket_accept, "enet_socket_accept");
            bindFunc(cast(void**)&enet_socket_connect, "enet_socket_connect");
            bindFunc(cast(void**)&enet_socket_send, "enet_socket_send");
            bindFunc(cast(void**)&enet_socket_receive, "enet_socket_receive");
            bindFunc(cast(void**)&enet_socket_wait, "enet_socket_wait");
            bindFunc(cast(void**)&enet_socket_set_option, "enet_socket_set_option");
            bindFunc(cast(void**)&enet_socket_get_option, "enet_socket_get_option");
            bindFunc(cast(void**)&enet_socket_shutdown, "enet_socket_shutdown");
            bindFunc(cast(void**)&enet_socket_destroy, "enet_socket_destroy");
            bindFunc(cast(void**)&enet_socketset_select, "enet_socketset_select");
            bindFunc(cast(void**)&enet_address_set_host, "enet_address_set_host");
            bindFunc(cast(void**)&enet_address_get_host_ip, "enet_address_get_host_ip");
            bindFunc(cast(void**)&enet_address_get_host, "enet_address_get_host");
            bindFunc(cast(void**)&enet_packet_create, "enet_packet_create");
            bindFunc(cast(void**)&enet_packet_destroy, "enet_packet_destroy");
            bindFunc(cast(void**)&enet_packet_resize, "enet_packet_resize");
            bindFunc(cast(void**)&enet_crc32, "enet_crc32");
            bindFunc(cast(void**)&enet_host_create, "enet_host_create");
            bindFunc(cast(void**)&enet_host_destroy, "enet_host_destroy");
            bindFunc(cast(void**)&enet_host_connect, "enet_host_connect");
            bindFunc(cast(void**)&enet_host_check_events, "enet_host_check_events");
            bindFunc(cast(void**)&enet_host_service, "enet_host_service");
            bindFunc(cast(void**)&enet_host_flush, "enet_host_flush");
            bindFunc(cast(void**)&enet_host_broadcast, "enet_host_broadcast");
            bindFunc(cast(void**)&enet_host_compress, "enet_host_compress");
            bindFunc(cast(void**)&enet_host_compress_with_range_coder, "enet_host_compress_with_range_coder");
            bindFunc(cast(void**)&enet_host_channel_limit, "enet_host_channel_limit");
            bindFunc(cast(void**)&enet_host_bandwidth_limit, "enet_host_bandwidth_limit");
            bindFunc(cast(void**)&enet_peer_send, "enet_peer_send");
            bindFunc(cast(void**)&enet_peer_receive, "enet_peer_receive");
            bindFunc(cast(void**)&enet_peer_ping, "enet_peer_ping");
            bindFunc(cast(void**)&enet_peer_ping_interval, "enet_peer_ping_interval");
            bindFunc(cast(void**)&enet_peer_timeout, "enet_peer_timeout");
            bindFunc(cast(void**)&enet_peer_reset, "enet_peer_reset");
            bindFunc(cast(void**)&enet_peer_disconnect, "enet_peer_disconnect");
            bindFunc(cast(void**)&enet_peer_disconnect_now, "enet_peer_disconnect_now");
            bindFunc(cast(void**)&enet_peer_disconnect_later, "enet_peer_disconnect_later");
            bindFunc(cast(void**)&enet_peer_throttle_configure, "enet_peer_throttle_configure");
            bindFunc(cast(void**)&enet_range_coder_create, "enet_range_coder_create");
            bindFunc(cast(void**)&enet_range_coder_destroy, "enet_range_coder_destroy");
            bindFunc(cast(void**)&enet_range_coder_compress, "enet_range_coder_compress");
            bindFunc(cast(void**)&enet_range_coder_decompress, "enet_range_coder_decompress");
        }
    }

    public
    {
        this()
        {
            super(libNames);
        }
    }
}

__gshared DerelictENetLoader DerelictENet;

shared static this()
{
    DerelictENet = new DerelictENetLoader();
}
