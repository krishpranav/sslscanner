module ScanSSL
    class Export
        def self.pdf(file, data)
            Prawn::Document.generate(file) do
                text "File saved as #{data}"
            end
        end
        