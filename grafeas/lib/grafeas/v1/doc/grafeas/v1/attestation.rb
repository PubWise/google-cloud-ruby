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


module Grafeas
  module V1
    # Note kind that represents a logical attestation "role" or "authority". For
    # example, an organization might have one `Authority` for "QA" and one for
    # "build". This note is intended to act strictly as a grouping mechanism for
    # the attached occurrences (Attestations). This grouping mechanism also
    # provides a security boundary, since IAM ACLs gate the ability for a principle
    # to attach an occurrence to a given note. It also provides a single point of
    # lookup to find all attached attestation occurrences, even if they don't all
    # live in the same project.
    # @!attribute [rw] hint
    #   @return [Grafeas::V1::AttestationNote::Hint]
    #     Hint hints at the purpose of the attestation authority.
    class AttestationNote
      # This submessage provides human-readable hints about the purpose of the
      # authority. Because the name of a note acts as its resource reference, it is
      # important to disambiguate the canonical name of the Note (which might be a
      # UUID for security purposes) from "readable" names more suitable for debug
      # output. Note that these hints should not be used to look up authorities in
      # security sensitive contexts, such as when looking up attestations to
      # verify.
      # @!attribute [rw] human_readable_name
      #   @return [String]
      #     Required. The human readable name of this attestation authority, for
      #     example "qa".
      class Hint; end
    end

    # Occurrence that represents a single "attestation". The authenticity of an
    # attestation can be verified using the attached signature. If the verifier
    # trusts the public key of the signer, then verifying the signature is
    # sufficient to establish trust. In this circumstance, the authority to which
    # this attestation is attached is primarily useful for lookup (how to find
    # this attestation if you already know the authority and artifact to be
    # verified) and intent (for which authority this attestation was intended to
    # sign.
    # @!attribute [rw] serialized_payload
    #   @return [String]
    #     Required. The serialized payload that is verified by one or more
    #     `signatures`.
    # @!attribute [rw] signatures
    #   @return [Array<Grafeas::V1::Signature>]
    #     One or more signatures over `serialized_payload`.  Verifier implementations
    #     should consider this attestation message verified if at least one
    #     `signature` verifies `serialized_payload`.  See `Signature` in common.proto
    #     for more details on signature structure and verification.
    class AttestationOccurrence; end
  end
end