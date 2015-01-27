module Eye
  class Notify
    # to satisfy gem packaking
    class Eye::Notify::Custom < Eye::Notify; end

    class Hipchat < Eye::Notify::Custom
      VERSION = "0.0.2"
    end
  end
end
