module ScanSSL
    class CertInfo < Certificate 
        def initialize(server, port)
            @ssl_context = OpenSSL::SSL::SSLContext.new
            @cert_store = OpenSSL::X509::Store.new
            @cert_store.set_default_paths
            @ssl_context.cert_store = @cert_store
            @tcp_socket = TCPSocket.new(server, port)
            @socket_destination = OpenSSL::SSL::SSLSocket.new @tcp_socket, @ssl_context
            @socket_destination.connect
        end

        def valid?
            return TRUTH_TABLE[(@socket_destination.verify_result == 0)]
        end
        
        def valid_from
            return cert.not_before
        end
        