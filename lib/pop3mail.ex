defmodule Pop3mail do

   @moduledoc """
   Download email and save to disk. Uses Erlang epop client.
   Handles multipart body. Saves header, body text and attachments.
   Decodes base64 and quoted printable text.
   Decodes encoded words in headers.

   Runs as CLI utility.
   """

   @doc "Call main optionally with username and password. E.g. main([\"--username=a.b@gmail.com\", \"--password=secret\"])"
   def downloader_cli(args) do
      Pop3mail.DownloaderCLI.main(args)
   end

   def download(username, password, pop3_server, pop3_port, ssl, max_mails, delete, delivered, save_raw, output_dir) do
      Pop3mail.download(username, password, pop3_server, pop3_port, ssl, max_mails, delete, delivered, save_raw, output_dir)
   end

   def header_lookup(header_list, header_name) do
      Pop3mail.Header.lookup(header_list, header_name)
   end

   def decode_header_text(text) do
      Pop3mail.HeaderDecoder.decode_text(text)
   end

   def decode_body(header_list, body_char_list) do
      Pop3mail.Handler.decode_body(header_list, body_char_list)
   end

   def decode_multipart(boundary_name, raw_content, path \\ '') do
      Pop3mail.Multipart.parse_multipart(boundary_name, raw_content, path)
   end

end