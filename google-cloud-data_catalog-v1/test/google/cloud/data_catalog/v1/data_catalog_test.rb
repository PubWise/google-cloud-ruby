# frozen_string_literal: true

# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require "simplecov"
require "minitest/autorun"

require "gapic/grpc/service_stub"

require "google/cloud/datacatalog/v1/datacatalog_pb"
require "google/cloud/datacatalog/v1/datacatalog_services_pb"
require "google/cloud/data_catalog/v1/data_catalog"

class Google::Cloud::DataCatalog::V1::DataCatalog::ClientTest < Minitest::Test
  class ClientStub
    attr_accessor :call_rpc_count, :requests

    def initialize response, operation, &block
      @response = response
      @operation = operation
      @block = block
      @call_rpc_count = 0
      @requests = []
    end

    def call_rpc *args
      @call_rpc_count += 1

      @requests << @block&.call(*args)

      yield @response, @operation if block_given?

      @response
    end
  end

  def test_search_catalog
    # Create GRPC objects.
    grpc_response = Google::Cloud::DataCatalog::V1::SearchCatalogResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    scope = {}
    query = "hello world"
    page_size = 42
    page_token = "hello world"
    order_by = "hello world"

    search_catalog_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :search_catalog, name
      assert_kind_of Google::Cloud::DataCatalog::V1::SearchCatalogRequest, request
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::DataCatalog::V1::SearchCatalogRequest::Scope), request.scope
      assert_equal "hello world", request.query
      assert_equal 42, request.page_size
      assert_equal "hello world", request.page_token
      assert_equal "hello world", request.order_by
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, search_catalog_client_stub do
      # Create client
      client = Google::Cloud::DataCatalog::V1::DataCatalog::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.search_catalog({ scope: scope, query: query, page_size: page_size, page_token: page_token, order_by: order_by }) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.search_catalog scope: scope, query: query, page_size: page_size, page_token: page_token, order_by: order_by do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.search_catalog Google::Cloud::DataCatalog::V1::SearchCatalogRequest.new(scope: scope, query: query, page_size: page_size, page_token: page_token, order_by: order_by) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.search_catalog({ scope: scope, query: query, page_size: page_size, page_token: page_token, order_by: order_by }, grpc_options) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.search_catalog Google::Cloud::DataCatalog::V1::SearchCatalogRequest.new(scope: scope, query: query, page_size: page_size, page_token: page_token, order_by: order_by), grpc_options do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, search_catalog_client_stub.call_rpc_count
    end
  end

  def test_create_entry_group
    # Create GRPC objects.
    grpc_response = Google::Cloud::DataCatalog::V1::EntryGroup.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    entry_group_id = "hello world"
    entry_group = {}

    create_entry_group_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :create_entry_group, name
      assert_kind_of Google::Cloud::DataCatalog::V1::CreateEntryGroupRequest, request
      assert_equal "hello world", request.parent
      assert_equal "hello world", request.entry_group_id
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::DataCatalog::V1::EntryGroup), request.entry_group
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, create_entry_group_client_stub do
      # Create client
      client = Google::Cloud::DataCatalog::V1::DataCatalog::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.create_entry_group({ parent: parent, entry_group_id: entry_group_id, entry_group: entry_group }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.create_entry_group parent: parent, entry_group_id: entry_group_id, entry_group: entry_group do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.create_entry_group Google::Cloud::DataCatalog::V1::CreateEntryGroupRequest.new(parent: parent, entry_group_id: entry_group_id, entry_group: entry_group) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.create_entry_group({ parent: parent, entry_group_id: entry_group_id, entry_group: entry_group }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.create_entry_group Google::Cloud::DataCatalog::V1::CreateEntryGroupRequest.new(parent: parent, entry_group_id: entry_group_id, entry_group: entry_group), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, create_entry_group_client_stub.call_rpc_count
    end
  end

  def test_get_entry_group
    # Create GRPC objects.
    grpc_response = Google::Cloud::DataCatalog::V1::EntryGroup.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"
    read_mask = {}

    get_entry_group_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :get_entry_group, name
      assert_kind_of Google::Cloud::DataCatalog::V1::GetEntryGroupRequest, request
      assert_equal "hello world", request.name
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Protobuf::FieldMask), request.read_mask
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, get_entry_group_client_stub do
      # Create client
      client = Google::Cloud::DataCatalog::V1::DataCatalog::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.get_entry_group({ name: name, read_mask: read_mask }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.get_entry_group name: name, read_mask: read_mask do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.get_entry_group Google::Cloud::DataCatalog::V1::GetEntryGroupRequest.new(name: name, read_mask: read_mask) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.get_entry_group({ name: name, read_mask: read_mask }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.get_entry_group Google::Cloud::DataCatalog::V1::GetEntryGroupRequest.new(name: name, read_mask: read_mask), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, get_entry_group_client_stub.call_rpc_count
    end
  end

  def test_update_entry_group
    # Create GRPC objects.
    grpc_response = Google::Cloud::DataCatalog::V1::EntryGroup.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    entry_group = {}
    update_mask = {}

    update_entry_group_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :update_entry_group, name
      assert_kind_of Google::Cloud::DataCatalog::V1::UpdateEntryGroupRequest, request
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::DataCatalog::V1::EntryGroup), request.entry_group
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Protobuf::FieldMask), request.update_mask
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, update_entry_group_client_stub do
      # Create client
      client = Google::Cloud::DataCatalog::V1::DataCatalog::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.update_entry_group({ entry_group: entry_group, update_mask: update_mask }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.update_entry_group entry_group: entry_group, update_mask: update_mask do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.update_entry_group Google::Cloud::DataCatalog::V1::UpdateEntryGroupRequest.new(entry_group: entry_group, update_mask: update_mask) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.update_entry_group({ entry_group: entry_group, update_mask: update_mask }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.update_entry_group Google::Cloud::DataCatalog::V1::UpdateEntryGroupRequest.new(entry_group: entry_group, update_mask: update_mask), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, update_entry_group_client_stub.call_rpc_count
    end
  end

  def test_delete_entry_group
    # Create GRPC objects.
    grpc_response = Google::Protobuf::Empty.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"
    force = true

    delete_entry_group_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :delete_entry_group, name
      assert_kind_of Google::Cloud::DataCatalog::V1::DeleteEntryGroupRequest, request
      assert_equal "hello world", request.name
      assert_equal true, request.force
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, delete_entry_group_client_stub do
      # Create client
      client = Google::Cloud::DataCatalog::V1::DataCatalog::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.delete_entry_group({ name: name, force: force }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.delete_entry_group name: name, force: force do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.delete_entry_group Google::Cloud::DataCatalog::V1::DeleteEntryGroupRequest.new(name: name, force: force) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.delete_entry_group({ name: name, force: force }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.delete_entry_group Google::Cloud::DataCatalog::V1::DeleteEntryGroupRequest.new(name: name, force: force), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, delete_entry_group_client_stub.call_rpc_count
    end
  end

  def test_list_entry_groups
    # Create GRPC objects.
    grpc_response = Google::Cloud::DataCatalog::V1::ListEntryGroupsResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    page_size = 42
    page_token = "hello world"

    list_entry_groups_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :list_entry_groups, name
      assert_kind_of Google::Cloud::DataCatalog::V1::ListEntryGroupsRequest, request
      assert_equal "hello world", request.parent
      assert_equal 42, request.page_size
      assert_equal "hello world", request.page_token
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, list_entry_groups_client_stub do
      # Create client
      client = Google::Cloud::DataCatalog::V1::DataCatalog::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.list_entry_groups({ parent: parent, page_size: page_size, page_token: page_token }) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.list_entry_groups parent: parent, page_size: page_size, page_token: page_token do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.list_entry_groups Google::Cloud::DataCatalog::V1::ListEntryGroupsRequest.new(parent: parent, page_size: page_size, page_token: page_token) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.list_entry_groups({ parent: parent, page_size: page_size, page_token: page_token }, grpc_options) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.list_entry_groups Google::Cloud::DataCatalog::V1::ListEntryGroupsRequest.new(parent: parent, page_size: page_size, page_token: page_token), grpc_options do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, list_entry_groups_client_stub.call_rpc_count
    end
  end

  def test_create_entry
    # Create GRPC objects.
    grpc_response = Google::Cloud::DataCatalog::V1::Entry.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    entry_id = "hello world"
    entry = {}

    create_entry_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :create_entry, name
      assert_kind_of Google::Cloud::DataCatalog::V1::CreateEntryRequest, request
      assert_equal "hello world", request.parent
      assert_equal "hello world", request.entry_id
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::DataCatalog::V1::Entry), request.entry
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, create_entry_client_stub do
      # Create client
      client = Google::Cloud::DataCatalog::V1::DataCatalog::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.create_entry({ parent: parent, entry_id: entry_id, entry: entry }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.create_entry parent: parent, entry_id: entry_id, entry: entry do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.create_entry Google::Cloud::DataCatalog::V1::CreateEntryRequest.new(parent: parent, entry_id: entry_id, entry: entry) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.create_entry({ parent: parent, entry_id: entry_id, entry: entry }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.create_entry Google::Cloud::DataCatalog::V1::CreateEntryRequest.new(parent: parent, entry_id: entry_id, entry: entry), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, create_entry_client_stub.call_rpc_count
    end
  end

  def test_update_entry
    # Create GRPC objects.
    grpc_response = Google::Cloud::DataCatalog::V1::Entry.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    entry = {}
    update_mask = {}

    update_entry_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :update_entry, name
      assert_kind_of Google::Cloud::DataCatalog::V1::UpdateEntryRequest, request
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::DataCatalog::V1::Entry), request.entry
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Protobuf::FieldMask), request.update_mask
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, update_entry_client_stub do
      # Create client
      client = Google::Cloud::DataCatalog::V1::DataCatalog::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.update_entry({ entry: entry, update_mask: update_mask }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.update_entry entry: entry, update_mask: update_mask do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.update_entry Google::Cloud::DataCatalog::V1::UpdateEntryRequest.new(entry: entry, update_mask: update_mask) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.update_entry({ entry: entry, update_mask: update_mask }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.update_entry Google::Cloud::DataCatalog::V1::UpdateEntryRequest.new(entry: entry, update_mask: update_mask), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, update_entry_client_stub.call_rpc_count
    end
  end

  def test_delete_entry
    # Create GRPC objects.
    grpc_response = Google::Protobuf::Empty.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    delete_entry_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :delete_entry, name
      assert_kind_of Google::Cloud::DataCatalog::V1::DeleteEntryRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, delete_entry_client_stub do
      # Create client
      client = Google::Cloud::DataCatalog::V1::DataCatalog::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.delete_entry({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.delete_entry name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.delete_entry Google::Cloud::DataCatalog::V1::DeleteEntryRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.delete_entry({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.delete_entry Google::Cloud::DataCatalog::V1::DeleteEntryRequest.new(name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, delete_entry_client_stub.call_rpc_count
    end
  end

  def test_get_entry
    # Create GRPC objects.
    grpc_response = Google::Cloud::DataCatalog::V1::Entry.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    get_entry_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :get_entry, name
      assert_kind_of Google::Cloud::DataCatalog::V1::GetEntryRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, get_entry_client_stub do
      # Create client
      client = Google::Cloud::DataCatalog::V1::DataCatalog::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.get_entry({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.get_entry name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.get_entry Google::Cloud::DataCatalog::V1::GetEntryRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.get_entry({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.get_entry Google::Cloud::DataCatalog::V1::GetEntryRequest.new(name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, get_entry_client_stub.call_rpc_count
    end
  end

  def test_lookup_entry
    # Create GRPC objects.
    grpc_response = Google::Cloud::DataCatalog::V1::Entry.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    linked_resource = "hello world"

    lookup_entry_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :lookup_entry, name
      assert_kind_of Google::Cloud::DataCatalog::V1::LookupEntryRequest, request
      assert_equal "hello world", request.linked_resource
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, lookup_entry_client_stub do
      # Create client
      client = Google::Cloud::DataCatalog::V1::DataCatalog::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.lookup_entry({ linked_resource: linked_resource }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.lookup_entry linked_resource: linked_resource do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.lookup_entry Google::Cloud::DataCatalog::V1::LookupEntryRequest.new(linked_resource: linked_resource) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.lookup_entry({ linked_resource: linked_resource }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.lookup_entry Google::Cloud::DataCatalog::V1::LookupEntryRequest.new(linked_resource: linked_resource), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, lookup_entry_client_stub.call_rpc_count
    end
  end

  def test_list_entries
    # Create GRPC objects.
    grpc_response = Google::Cloud::DataCatalog::V1::ListEntriesResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    page_size = 42
    page_token = "hello world"
    read_mask = {}

    list_entries_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :list_entries, name
      assert_kind_of Google::Cloud::DataCatalog::V1::ListEntriesRequest, request
      assert_equal "hello world", request.parent
      assert_equal 42, request.page_size
      assert_equal "hello world", request.page_token
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Protobuf::FieldMask), request.read_mask
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, list_entries_client_stub do
      # Create client
      client = Google::Cloud::DataCatalog::V1::DataCatalog::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.list_entries({ parent: parent, page_size: page_size, page_token: page_token, read_mask: read_mask }) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.list_entries parent: parent, page_size: page_size, page_token: page_token, read_mask: read_mask do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.list_entries Google::Cloud::DataCatalog::V1::ListEntriesRequest.new(parent: parent, page_size: page_size, page_token: page_token, read_mask: read_mask) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.list_entries({ parent: parent, page_size: page_size, page_token: page_token, read_mask: read_mask }, grpc_options) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.list_entries Google::Cloud::DataCatalog::V1::ListEntriesRequest.new(parent: parent, page_size: page_size, page_token: page_token, read_mask: read_mask), grpc_options do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, list_entries_client_stub.call_rpc_count
    end
  end

  def test_create_tag_template
    # Create GRPC objects.
    grpc_response = Google::Cloud::DataCatalog::V1::TagTemplate.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    tag_template_id = "hello world"
    tag_template = {}

    create_tag_template_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :create_tag_template, name
      assert_kind_of Google::Cloud::DataCatalog::V1::CreateTagTemplateRequest, request
      assert_equal "hello world", request.parent
      assert_equal "hello world", request.tag_template_id
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::DataCatalog::V1::TagTemplate), request.tag_template
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, create_tag_template_client_stub do
      # Create client
      client = Google::Cloud::DataCatalog::V1::DataCatalog::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.create_tag_template({ parent: parent, tag_template_id: tag_template_id, tag_template: tag_template }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.create_tag_template parent: parent, tag_template_id: tag_template_id, tag_template: tag_template do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.create_tag_template Google::Cloud::DataCatalog::V1::CreateTagTemplateRequest.new(parent: parent, tag_template_id: tag_template_id, tag_template: tag_template) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.create_tag_template({ parent: parent, tag_template_id: tag_template_id, tag_template: tag_template }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.create_tag_template Google::Cloud::DataCatalog::V1::CreateTagTemplateRequest.new(parent: parent, tag_template_id: tag_template_id, tag_template: tag_template), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, create_tag_template_client_stub.call_rpc_count
    end
  end

  def test_get_tag_template
    # Create GRPC objects.
    grpc_response = Google::Cloud::DataCatalog::V1::TagTemplate.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    get_tag_template_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :get_tag_template, name
      assert_kind_of Google::Cloud::DataCatalog::V1::GetTagTemplateRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, get_tag_template_client_stub do
      # Create client
      client = Google::Cloud::DataCatalog::V1::DataCatalog::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.get_tag_template({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.get_tag_template name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.get_tag_template Google::Cloud::DataCatalog::V1::GetTagTemplateRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.get_tag_template({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.get_tag_template Google::Cloud::DataCatalog::V1::GetTagTemplateRequest.new(name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, get_tag_template_client_stub.call_rpc_count
    end
  end

  def test_update_tag_template
    # Create GRPC objects.
    grpc_response = Google::Cloud::DataCatalog::V1::TagTemplate.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    tag_template = {}
    update_mask = {}

    update_tag_template_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :update_tag_template, name
      assert_kind_of Google::Cloud::DataCatalog::V1::UpdateTagTemplateRequest, request
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::DataCatalog::V1::TagTemplate), request.tag_template
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Protobuf::FieldMask), request.update_mask
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, update_tag_template_client_stub do
      # Create client
      client = Google::Cloud::DataCatalog::V1::DataCatalog::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.update_tag_template({ tag_template: tag_template, update_mask: update_mask }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.update_tag_template tag_template: tag_template, update_mask: update_mask do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.update_tag_template Google::Cloud::DataCatalog::V1::UpdateTagTemplateRequest.new(tag_template: tag_template, update_mask: update_mask) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.update_tag_template({ tag_template: tag_template, update_mask: update_mask }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.update_tag_template Google::Cloud::DataCatalog::V1::UpdateTagTemplateRequest.new(tag_template: tag_template, update_mask: update_mask), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, update_tag_template_client_stub.call_rpc_count
    end
  end

  def test_delete_tag_template
    # Create GRPC objects.
    grpc_response = Google::Protobuf::Empty.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"
    force = true

    delete_tag_template_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :delete_tag_template, name
      assert_kind_of Google::Cloud::DataCatalog::V1::DeleteTagTemplateRequest, request
      assert_equal "hello world", request.name
      assert_equal true, request.force
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, delete_tag_template_client_stub do
      # Create client
      client = Google::Cloud::DataCatalog::V1::DataCatalog::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.delete_tag_template({ name: name, force: force }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.delete_tag_template name: name, force: force do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.delete_tag_template Google::Cloud::DataCatalog::V1::DeleteTagTemplateRequest.new(name: name, force: force) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.delete_tag_template({ name: name, force: force }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.delete_tag_template Google::Cloud::DataCatalog::V1::DeleteTagTemplateRequest.new(name: name, force: force), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, delete_tag_template_client_stub.call_rpc_count
    end
  end

  def test_create_tag_template_field
    # Create GRPC objects.
    grpc_response = Google::Cloud::DataCatalog::V1::TagTemplateField.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    tag_template_field_id = "hello world"
    tag_template_field = {}

    create_tag_template_field_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :create_tag_template_field, name
      assert_kind_of Google::Cloud::DataCatalog::V1::CreateTagTemplateFieldRequest, request
      assert_equal "hello world", request.parent
      assert_equal "hello world", request.tag_template_field_id
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::DataCatalog::V1::TagTemplateField), request.tag_template_field
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, create_tag_template_field_client_stub do
      # Create client
      client = Google::Cloud::DataCatalog::V1::DataCatalog::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.create_tag_template_field({ parent: parent, tag_template_field_id: tag_template_field_id, tag_template_field: tag_template_field }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.create_tag_template_field parent: parent, tag_template_field_id: tag_template_field_id, tag_template_field: tag_template_field do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.create_tag_template_field Google::Cloud::DataCatalog::V1::CreateTagTemplateFieldRequest.new(parent: parent, tag_template_field_id: tag_template_field_id, tag_template_field: tag_template_field) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.create_tag_template_field({ parent: parent, tag_template_field_id: tag_template_field_id, tag_template_field: tag_template_field }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.create_tag_template_field Google::Cloud::DataCatalog::V1::CreateTagTemplateFieldRequest.new(parent: parent, tag_template_field_id: tag_template_field_id, tag_template_field: tag_template_field), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, create_tag_template_field_client_stub.call_rpc_count
    end
  end

  def test_update_tag_template_field
    # Create GRPC objects.
    grpc_response = Google::Cloud::DataCatalog::V1::TagTemplateField.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"
    tag_template_field = {}
    update_mask = {}

    update_tag_template_field_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :update_tag_template_field, name
      assert_kind_of Google::Cloud::DataCatalog::V1::UpdateTagTemplateFieldRequest, request
      assert_equal "hello world", request.name
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::DataCatalog::V1::TagTemplateField), request.tag_template_field
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Protobuf::FieldMask), request.update_mask
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, update_tag_template_field_client_stub do
      # Create client
      client = Google::Cloud::DataCatalog::V1::DataCatalog::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.update_tag_template_field({ name: name, tag_template_field: tag_template_field, update_mask: update_mask }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.update_tag_template_field name: name, tag_template_field: tag_template_field, update_mask: update_mask do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.update_tag_template_field Google::Cloud::DataCatalog::V1::UpdateTagTemplateFieldRequest.new(name: name, tag_template_field: tag_template_field, update_mask: update_mask) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.update_tag_template_field({ name: name, tag_template_field: tag_template_field, update_mask: update_mask }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.update_tag_template_field Google::Cloud::DataCatalog::V1::UpdateTagTemplateFieldRequest.new(name: name, tag_template_field: tag_template_field, update_mask: update_mask), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, update_tag_template_field_client_stub.call_rpc_count
    end
  end

  def test_rename_tag_template_field
    # Create GRPC objects.
    grpc_response = Google::Cloud::DataCatalog::V1::TagTemplateField.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"
    new_tag_template_field_id = "hello world"

    rename_tag_template_field_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :rename_tag_template_field, name
      assert_kind_of Google::Cloud::DataCatalog::V1::RenameTagTemplateFieldRequest, request
      assert_equal "hello world", request.name
      assert_equal "hello world", request.new_tag_template_field_id
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, rename_tag_template_field_client_stub do
      # Create client
      client = Google::Cloud::DataCatalog::V1::DataCatalog::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.rename_tag_template_field({ name: name, new_tag_template_field_id: new_tag_template_field_id }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.rename_tag_template_field name: name, new_tag_template_field_id: new_tag_template_field_id do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.rename_tag_template_field Google::Cloud::DataCatalog::V1::RenameTagTemplateFieldRequest.new(name: name, new_tag_template_field_id: new_tag_template_field_id) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.rename_tag_template_field({ name: name, new_tag_template_field_id: new_tag_template_field_id }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.rename_tag_template_field Google::Cloud::DataCatalog::V1::RenameTagTemplateFieldRequest.new(name: name, new_tag_template_field_id: new_tag_template_field_id), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, rename_tag_template_field_client_stub.call_rpc_count
    end
  end

  def test_delete_tag_template_field
    # Create GRPC objects.
    grpc_response = Google::Protobuf::Empty.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"
    force = true

    delete_tag_template_field_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :delete_tag_template_field, name
      assert_kind_of Google::Cloud::DataCatalog::V1::DeleteTagTemplateFieldRequest, request
      assert_equal "hello world", request.name
      assert_equal true, request.force
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, delete_tag_template_field_client_stub do
      # Create client
      client = Google::Cloud::DataCatalog::V1::DataCatalog::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.delete_tag_template_field({ name: name, force: force }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.delete_tag_template_field name: name, force: force do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.delete_tag_template_field Google::Cloud::DataCatalog::V1::DeleteTagTemplateFieldRequest.new(name: name, force: force) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.delete_tag_template_field({ name: name, force: force }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.delete_tag_template_field Google::Cloud::DataCatalog::V1::DeleteTagTemplateFieldRequest.new(name: name, force: force), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, delete_tag_template_field_client_stub.call_rpc_count
    end
  end

  def test_create_tag
    # Create GRPC objects.
    grpc_response = Google::Cloud::DataCatalog::V1::Tag.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    tag = {}

    create_tag_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :create_tag, name
      assert_kind_of Google::Cloud::DataCatalog::V1::CreateTagRequest, request
      assert_equal "hello world", request.parent
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::DataCatalog::V1::Tag), request.tag
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, create_tag_client_stub do
      # Create client
      client = Google::Cloud::DataCatalog::V1::DataCatalog::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.create_tag({ parent: parent, tag: tag }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.create_tag parent: parent, tag: tag do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.create_tag Google::Cloud::DataCatalog::V1::CreateTagRequest.new(parent: parent, tag: tag) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.create_tag({ parent: parent, tag: tag }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.create_tag Google::Cloud::DataCatalog::V1::CreateTagRequest.new(parent: parent, tag: tag), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, create_tag_client_stub.call_rpc_count
    end
  end

  def test_update_tag
    # Create GRPC objects.
    grpc_response = Google::Cloud::DataCatalog::V1::Tag.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    tag = {}
    update_mask = {}

    update_tag_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :update_tag, name
      assert_kind_of Google::Cloud::DataCatalog::V1::UpdateTagRequest, request
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::DataCatalog::V1::Tag), request.tag
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Protobuf::FieldMask), request.update_mask
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, update_tag_client_stub do
      # Create client
      client = Google::Cloud::DataCatalog::V1::DataCatalog::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.update_tag({ tag: tag, update_mask: update_mask }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.update_tag tag: tag, update_mask: update_mask do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.update_tag Google::Cloud::DataCatalog::V1::UpdateTagRequest.new(tag: tag, update_mask: update_mask) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.update_tag({ tag: tag, update_mask: update_mask }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.update_tag Google::Cloud::DataCatalog::V1::UpdateTagRequest.new(tag: tag, update_mask: update_mask), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, update_tag_client_stub.call_rpc_count
    end
  end

  def test_delete_tag
    # Create GRPC objects.
    grpc_response = Google::Protobuf::Empty.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    delete_tag_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :delete_tag, name
      assert_kind_of Google::Cloud::DataCatalog::V1::DeleteTagRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, delete_tag_client_stub do
      # Create client
      client = Google::Cloud::DataCatalog::V1::DataCatalog::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.delete_tag({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.delete_tag name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.delete_tag Google::Cloud::DataCatalog::V1::DeleteTagRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.delete_tag({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.delete_tag Google::Cloud::DataCatalog::V1::DeleteTagRequest.new(name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, delete_tag_client_stub.call_rpc_count
    end
  end

  def test_list_tags
    # Create GRPC objects.
    grpc_response = Google::Cloud::DataCatalog::V1::ListTagsResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    page_size = 42
    page_token = "hello world"

    list_tags_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :list_tags, name
      assert_kind_of Google::Cloud::DataCatalog::V1::ListTagsRequest, request
      assert_equal "hello world", request.parent
      assert_equal 42, request.page_size
      assert_equal "hello world", request.page_token
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, list_tags_client_stub do
      # Create client
      client = Google::Cloud::DataCatalog::V1::DataCatalog::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.list_tags({ parent: parent, page_size: page_size, page_token: page_token }) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.list_tags parent: parent, page_size: page_size, page_token: page_token do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.list_tags Google::Cloud::DataCatalog::V1::ListTagsRequest.new(parent: parent, page_size: page_size, page_token: page_token) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.list_tags({ parent: parent, page_size: page_size, page_token: page_token }, grpc_options) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.list_tags Google::Cloud::DataCatalog::V1::ListTagsRequest.new(parent: parent, page_size: page_size, page_token: page_token), grpc_options do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, list_tags_client_stub.call_rpc_count
    end
  end

  def test_set_iam_policy
    # Create GRPC objects.
    grpc_response = Google::Iam::V1::Policy.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    resource = "hello world"
    policy = {}

    set_iam_policy_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :set_iam_policy, name
      assert_kind_of Google::Iam::V1::SetIamPolicyRequest, request
      assert_equal "hello world", request.resource
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Iam::V1::Policy), request.policy
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, set_iam_policy_client_stub do
      # Create client
      client = Google::Cloud::DataCatalog::V1::DataCatalog::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.set_iam_policy({ resource: resource, policy: policy }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.set_iam_policy resource: resource, policy: policy do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.set_iam_policy Google::Iam::V1::SetIamPolicyRequest.new(resource: resource, policy: policy) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.set_iam_policy({ resource: resource, policy: policy }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.set_iam_policy Google::Iam::V1::SetIamPolicyRequest.new(resource: resource, policy: policy), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, set_iam_policy_client_stub.call_rpc_count
    end
  end

  def test_get_iam_policy
    # Create GRPC objects.
    grpc_response = Google::Iam::V1::Policy.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    resource = "hello world"

    get_iam_policy_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :get_iam_policy, name
      assert_kind_of Google::Iam::V1::GetIamPolicyRequest, request
      assert_equal "hello world", request.resource
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, get_iam_policy_client_stub do
      # Create client
      client = Google::Cloud::DataCatalog::V1::DataCatalog::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.get_iam_policy({ resource: resource }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.get_iam_policy resource: resource do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.get_iam_policy Google::Iam::V1::GetIamPolicyRequest.new(resource: resource) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.get_iam_policy({ resource: resource }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.get_iam_policy Google::Iam::V1::GetIamPolicyRequest.new(resource: resource), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, get_iam_policy_client_stub.call_rpc_count
    end
  end

  def test_test_iam_permissions
    # Create GRPC objects.
    grpc_response = Google::Iam::V1::TestIamPermissionsResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    resource = "hello world"
    permissions = ["hello world"]

    test_iam_permissions_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :test_iam_permissions, name
      assert_kind_of Google::Iam::V1::TestIamPermissionsRequest, request
      assert_equal "hello world", request.resource
      assert_equal ["hello world"], request.permissions
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, test_iam_permissions_client_stub do
      # Create client
      client = Google::Cloud::DataCatalog::V1::DataCatalog::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.test_iam_permissions({ resource: resource, permissions: permissions }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.test_iam_permissions resource: resource, permissions: permissions do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.test_iam_permissions Google::Iam::V1::TestIamPermissionsRequest.new(resource: resource, permissions: permissions) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.test_iam_permissions({ resource: resource, permissions: permissions }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.test_iam_permissions Google::Iam::V1::TestIamPermissionsRequest.new(resource: resource, permissions: permissions), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, test_iam_permissions_client_stub.call_rpc_count
    end
  end
end