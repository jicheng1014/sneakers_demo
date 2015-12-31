class DemoWorker
  include Sneakers::Worker
  from_queue :demo

  def work(message)
    puts "message is #{message}"
    Post.create!(title: "message from mq", body: message, published: false)
    ack!
  end
end
