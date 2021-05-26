#!/usr/bin/env ruby

# requires
require 'colorize'
require 'getoptlong'
require 'openssl'
require 'socket'
require 'webrick'
require 'prawn'

require 'sslscanner/version'
require 'sslscanner/settings'
require 'sslscanner/certInfo'
require 'sslscanner/fileExport'
require 'sslscanner/scanHost'

module ScanSSL
    class Command
        def self.call(options = {})
            @server = options[:server]
            @port = options[:port]

            if options[:check_cert] == true
                a = ScanSSL::CertInfo.new(@server, @port)
                colorOutputCert(a.valid?,
                    a.valid_from, 
                    a.valid_until, 
                    a.issuer, 
                    a.subject, 
                    a.algorithm, 
                    a.key_size, 
                    a.public_key)
                end

            if options[:check_cert] == nil
                run = ScanSSL::ScanHost.new
                puts run.scan(@server, @port)
            end
        end

        def self.colorOutputCert(cValid, cFrom, cUntil, cIssuer, cSubject, cAlgorithm, cKey, cPublic)
            puts "===== CERTIFICATE INFORMATION ====".bold
            puts "domain: #{@server}"
            puts "port: #{@port}"
            puts "--------------------"
            puts "valid: #{cValid}"
            puts "valid from: #{cFrom}"
            puts "valid until: #{cUntil}"
            puts "issuer: #{cIssuer}"
            puts "subject: #{cSubject}"
            puts "algorithm: #{cAlgorithm}"
            puts "key size: #{cKey}"
            puts "public key: "
            puts "#{public_key}"    
        end
    end
end

        
