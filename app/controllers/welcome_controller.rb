class WelcomeController < ApplicationController
  def upload
    @testing = "HAHAHAHAAHAHA"
    @file = params[:picture]


    s3 = Aws::S3::Resource.new(region:'us-east-1')
    #obj = s3.bucket('food-trucks').object(key: 'testing-1')
    obj = s3.bucket('food-trucks').objects.create("testing.jpg", @file.tempfile)
    #obj.upload_file(@file)

  end
end
