require 'sinatra'
require 'rqrcode'

get '/' do
   if params[:m].to_s.length > 0
      @qrcode = RQRCode::QRCode.new(params[:m].to_s)
      @img = @qrcode.as_png(resize_gte_to: false, resize_exactly_to: false, fill: 'white', color: 'black', size: 460, border_modules: 4, module_px_size: 6, file: nil)
   end
   
   erb :index
end


get '/download' do
   content_type 'image/png'
   attachment 'qr.png'

   if params[:m].to_s.length == 0
      redirect '/'
   end

   # ensure 120px min, 2000px max or 600px as a default size
   qrSize = (2000 if params[:s].to_i > 2000) || (600 if params[:s].to_i == 0) || (120 if params[:s].to_i < 120) || params[:s].to_i

   qrcode = RQRCode::QRCode.new(params[:m].to_s)
   img = qrcode.as_png(resize_gte_to: false, resize_exactly_to: false, fill: 'white', color: 'black', size: qrSize, border_modules: 4, module_px_size: 6, file: nil)
   img.to_blob
end