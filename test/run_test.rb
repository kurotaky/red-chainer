base_dir = File.expand_path(File.join(File.dirname(__FILE__), ".."))
lib_dir  = File.join(base_dir, "lib")
test_dir = File.join(base_dir, "test")

$LOAD_PATH.unshift(lib_dir)

require 'test/unit'
require 'chainer'

def require_gpu(id = nil)
  omit(['GPU', id, 'is needed'].join(' ')) unless Chainer::CUDA.available?(id)
end

def xm
  Chainer::Device.default.xm
end

device = Chainer::Device.create(Integer(ENV['RED_CHAINER_GPU'] || -1))
Chainer::Device.change_default(device)

exit Test::Unit::AutoRunner.run(true, test_dir)
