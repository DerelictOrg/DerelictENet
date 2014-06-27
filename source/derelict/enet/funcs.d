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
module derelict.enet.funcs;


private
{
    import derelict.enet.types;
    import derelict.enet.types;
}

extern(C)
{
    // enet.h
    alias nothrow int function() da_enet_initialize;
    alias nothrow int function(ENetVersion version_, const ENetCallbacks * inits) da_enet_initialize_with_callbacks;
    alias nothrow void function() da_enet_deinitialize;
    alias nothrow ENetVersion function() da_enet_linked_version;
    alias nothrow enet_uint32 function() da_enet_time_get;
    alias nothrow void function(enet_uint32) da_enet_time_set;
    alias nothrow ENetSocket function(ENetSocketType) da_enet_socket_create;
    alias nothrow int        function(ENetSocket, const ENetAddress *) da_enet_socket_bind;
    alias nothrow int        function(ENetSocket, ENetAddress *) da_enet_socket_get_address;
    alias nothrow int        function(ENetSocket, int) da_enet_socket_listen;
    alias nothrow ENetSocket function(ENetSocket, ENetAddress *) da_enet_socket_accept;
    alias nothrow int        function(ENetSocket, const ENetAddress *) da_enet_socket_connect;
    alias nothrow int        function(ENetSocket, const ENetAddress *, const ENetBuffer *, size_t) da_enet_socket_send;
    alias nothrow int        function(ENetSocket, ENetAddress *, ENetBuffer *, size_t) da_enet_socket_receive;
    alias nothrow int        function(ENetSocket, enet_uint32 *, enet_uint32) da_enet_socket_wait;
    alias nothrow int        function(ENetSocket, ENetSocketOption, int) da_enet_socket_set_option;
    alias nothrow int        function(ENetSocket, ENetSocketOption, int *) da_enet_socket_get_option;
    alias nothrow int        function(ENetSocket, ENetSocketShutdown) da_enet_socket_shutdown;
    alias nothrow void       function(ENetSocket) da_enet_socket_destroy;
    alias nothrow int        function(ENetSocket, ENetSocketSet *, ENetSocketSet *, enet_uint32) da_enet_socketset_select;
    alias nothrow int function(ENetAddress * address, const char * hostName) da_enet_address_set_host;
    alias nothrow int function(const ENetAddress * address, char * hostName, size_t nameLength) da_enet_address_get_host_ip;
    alias nothrow int function(const ENetAddress * address, char * hostName, size_t nameLength) da_enet_address_get_host;
    alias nothrow ENetPacket * function(const void *, size_t, enet_uint32) da_enet_packet_create;
    alias nothrow void         function(ENetPacket *) da_enet_packet_destroy;
    alias nothrow int          function (ENetPacket *, size_t) da_enet_packet_resize;
    alias nothrow enet_uint32  function(const ENetBuffer *, size_t) da_enet_crc32;
    alias nothrow ENetHost * function(const ENetAddress *, size_t, size_t, enet_uint32, enet_uint32) da_enet_host_create;
    alias nothrow void       function(ENetHost *) da_enet_host_destroy;
    alias nothrow ENetPeer * function(ENetHost *, const ENetAddress *, size_t, enet_uint32) da_enet_host_connect;
    alias nothrow int        function(ENetHost *, ENetEvent *) da_enet_host_check_events;
    alias nothrow int        function(ENetHost *, ENetEvent *, enet_uint32) da_enet_host_service;
    alias nothrow void       function(ENetHost *) da_enet_host_flush;
    alias nothrow void       function(ENetHost *, enet_uint8, ENetPacket *) da_enet_host_broadcast;
    alias nothrow void       function(ENetHost *, const ENetCompressor *) da_enet_host_compress;
    alias nothrow int        function(ENetHost * host) da_enet_host_compress_with_range_coder;
    alias nothrow void       function(ENetHost *, size_t) da_enet_host_channel_limit;
    alias nothrow void       function(ENetHost *, enet_uint32, enet_uint32) da_enet_host_bandwidth_limit;
    alias nothrow int                 function(ENetPeer *, enet_uint8, ENetPacket *) da_enet_peer_send;
    alias nothrow ENetPacket *        function(ENetPeer *, enet_uint8 * channelID) da_enet_peer_receive;
    alias nothrow void                function(ENetPeer *) da_enet_peer_ping;
    alias nothrow void                function(ENetPeer *, enet_uint32) da_enet_peer_ping_interval;
    alias nothrow void                function(ENetPeer *, enet_uint32, enet_uint32, enet_uint32) da_enet_peer_timeout;
    alias nothrow void                function(ENetPeer *) da_enet_peer_reset;
    alias nothrow void                function(ENetPeer *, enet_uint32) da_enet_peer_disconnect;
    alias nothrow void                function(ENetPeer *, enet_uint32) da_enet_peer_disconnect_now;
    alias nothrow void                function(ENetPeer *, enet_uint32) da_enet_peer_disconnect_later;
    alias nothrow void                function(ENetPeer *, enet_uint32, enet_uint32, enet_uint32) da_enet_peer_throttle_configure;
    alias nothrow void * function() da_enet_range_coder_create;
    alias nothrow void   function(void *) da_enet_range_coder_destroy;
    alias nothrow size_t function(void *, const ENetBuffer *, size_t, size_t, enet_uint8 *, size_t) da_enet_range_coder_compress;
    alias nothrow size_t function(void *, const enet_uint8 *, size_t, enet_uint8 *, size_t) da_enet_range_coder_decompress;
}

__gshared
{
    da_enet_initialize enet_initialize;
    da_enet_initialize_with_callbacks enet_initialize_with_callbacks;
    da_enet_deinitialize enet_deinitialize;
    da_enet_linked_version enet_linked_version;
    da_enet_time_get enet_time_get;
    da_enet_socket_create enet_socket_create;
    da_enet_socket_bind enet_socket_bind;
    da_enet_socket_get_address enet_socket_get_address;
    da_enet_socket_listen enet_socket_listen;
    da_enet_socket_accept enet_socket_accept;
    da_enet_socket_connect enet_socket_connect;
    da_enet_socket_send enet_socket_send;
    da_enet_socket_receive enet_socket_receive;
    da_enet_socket_wait enet_socket_wait;
    da_enet_socket_set_option enet_socket_set_option;
    da_enet_socket_get_option enet_socket_get_option;
    da_enet_socket_shutdown enet_socket_shutdown;
    da_enet_socket_destroy enet_socket_destroy;
    da_enet_socketset_select enet_socketset_select;
    da_enet_address_set_host enet_address_set_host;
    da_enet_address_get_host_ip enet_address_get_host_ip;
    da_enet_address_get_host enet_address_get_host;
    da_enet_packet_create enet_packet_create;
    da_enet_packet_destroy enet_packet_destroy;
    da_enet_packet_resize enet_packet_resize;
    da_enet_crc32 enet_crc32;
    da_enet_host_create enet_host_create;
    da_enet_host_destroy enet_host_destroy;
    da_enet_host_connect enet_host_connect;
    da_enet_host_check_events enet_host_check_events;
    da_enet_host_service enet_host_service;
    da_enet_host_flush enet_host_flush;
    da_enet_host_broadcast enet_host_broadcast;
    da_enet_host_compress enet_host_compress;
    da_enet_host_compress_with_range_coder enet_host_compress_with_range_coder;
    da_enet_host_channel_limit enet_host_channel_limit;
    da_enet_host_bandwidth_limit enet_host_bandwidth_limit;
    da_enet_peer_send enet_peer_send;
    da_enet_peer_receive enet_peer_receive;
    da_enet_peer_ping enet_peer_ping;
    da_enet_peer_ping_interval enet_peer_ping_interval;
    da_enet_peer_timeout enet_peer_timeout;
    da_enet_peer_reset enet_peer_reset;
    da_enet_peer_disconnect enet_peer_disconnect;
    da_enet_peer_disconnect_now enet_peer_disconnect_now;
    da_enet_peer_disconnect_later enet_peer_disconnect_later;
    da_enet_peer_throttle_configure enet_peer_throttle_configure;
    da_enet_range_coder_create enet_range_coder_create;
    da_enet_range_coder_destroy enet_range_coder_destroy;
    da_enet_range_coder_compress enet_range_coder_compress;
    da_enet_range_coder_decompress enet_range_coder_decompress;
}


  

