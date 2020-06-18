# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/devtools/clouddebugger/v2/controller.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/devtools/clouddebugger/v2/data_pb'
require 'google/protobuf/empty_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/devtools/clouddebugger/v2/controller.proto", :syntax => :proto3) do
    add_message "google.devtools.clouddebugger.v2.RegisterDebuggeeRequest" do
      optional :debuggee, :message, 1, "google.devtools.clouddebugger.v2.Debuggee"
    end
    add_message "google.devtools.clouddebugger.v2.RegisterDebuggeeResponse" do
      optional :debuggee, :message, 1, "google.devtools.clouddebugger.v2.Debuggee"
    end
    add_message "google.devtools.clouddebugger.v2.ListActiveBreakpointsRequest" do
      optional :debuggee_id, :string, 1
      optional :wait_token, :string, 2
      optional :success_on_timeout, :bool, 3
    end
    add_message "google.devtools.clouddebugger.v2.ListActiveBreakpointsResponse" do
      repeated :breakpoints, :message, 1, "google.devtools.clouddebugger.v2.Breakpoint"
      optional :next_wait_token, :string, 2
      optional :wait_expired, :bool, 3
    end
    add_message "google.devtools.clouddebugger.v2.UpdateActiveBreakpointRequest" do
      optional :debuggee_id, :string, 1
      optional :breakpoint, :message, 2, "google.devtools.clouddebugger.v2.Breakpoint"
    end
    add_message "google.devtools.clouddebugger.v2.UpdateActiveBreakpointResponse" do
    end
  end
end

module Google
  module Cloud
    module Debugger
      module V2
        RegisterDebuggeeRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.devtools.clouddebugger.v2.RegisterDebuggeeRequest").msgclass
        RegisterDebuggeeResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.devtools.clouddebugger.v2.RegisterDebuggeeResponse").msgclass
        ListActiveBreakpointsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.devtools.clouddebugger.v2.ListActiveBreakpointsRequest").msgclass
        ListActiveBreakpointsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.devtools.clouddebugger.v2.ListActiveBreakpointsResponse").msgclass
        UpdateActiveBreakpointRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.devtools.clouddebugger.v2.UpdateActiveBreakpointRequest").msgclass
        UpdateActiveBreakpointResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.devtools.clouddebugger.v2.UpdateActiveBreakpointResponse").msgclass
      end
    end
  end
end
