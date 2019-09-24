require 'sneakers'
require 'sneakers/handlers/maxretry'

module Connection
  def self.sneakers
    @_sneakers ||= begin
      Bunny.new(
        addresses: 'lion.rmq.cloudamqp.com',
        username:  'pconpuub',
        password:  'Y8IjBDtuqg2BfSnGIkRXAb0bYjEgMbax',
        vhost:     'pconpuub'
      )
    end
  end
end

Sneakers.configure  connection: Connection.sneakers,
                    exchange: 'sneakers',
                    runner_config_file: nil,                             # A configuration file (see below)
                    metric: nil,                                         # A metrics provider implementation
                    daemonize:false,                                     # Send to background
                    log: STDOUT,                                         # Log file
                    pid_path: 'sneakers.pid',                            # Pid file
                    timeout_job_after: 5.minutes,                        # Maximal seconds to wait for job
                    durable: true,                                       # Is queue durable?
                    ack: true,                                           # Must we acknowledge?
                    heartbeat: 5,                                        # Keep a good connection with broker
                    handler: Sneakers::Handlers::Maxretry,
                    retry_max_times: 10,                                  # how many times to retry the failed worker process
                    retry_timeout: 3 * 60 * 1000                        # how long between each worker retry duration

Sneakers.logger.level = Logger::INFO #Logger::DEBUG
Sneakers.logger.formatter = Sneakers::Support::ProductionFormatter