class DeferredGarbageCollection
  RESERVED_IVARS = %w(@loaded_fixtures)
  DEFERRED_GC_THRESHOLD = (ENV['DEFER_GC'] || 10.0).to_f
  @@last_gc_run = Time.now
  def self.start
    GC.disable if DEFERRED_GC_THRESHOLD > 0
  end
  def self.reconsider
    if DEFERRED_GC_THRESHOLD > 0 && Time.now - @@last_gc_run >= DEFERRED_GC_THRESHOLD
      GC.enable
      GC.start
      GC.disable
      @@last_gc_run = Time.now
    end
  end
end

RSpec.configure do |config|
  config.before(:all) do
    DeferredGarbageCollection.start
  end
  config.after(:each) do
   (instance_variables - DeferredGarbageCollection::RESERVED_IVARS).each do |ivar|
     instance_variable_set(ivar, nil)
   end
  end
  config.after(:all) do
    DeferredGarbageCollection.reconsider
  end
end