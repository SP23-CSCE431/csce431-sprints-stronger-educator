require 'aws-sdk-s3'

ENV['S3_BUCKET_NAME'] = 'strongereducator'
ENV['AWS_ACCESS_KEY_ID'] = 'AKIAZHZJG4VBFHCYAFHX'
ENV['AWS_SECRET_ACCESS_KEY'] = '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'


Aws.config.update({
  region: 'us-east-1',
  credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY'])
})



puts "S3_BUCKET_NAME: #{ENV['S3_BUCKET_NAME']}" # Add this line to print the value of the environment variable

S3_BUCKET = Aws::S3::Resource.new.bucket(ENV['S3_BUCKET_NAME'])