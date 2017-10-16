require "rails_helper"

describe Feedback do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_presence_of :text }

  describe "#name" do
    let(:feedback) { build(:feedback) }
    let(:name) { "#{feedback.name}" }
    let(:email) { "#{feedback.email}" }
    let(:text) { "#{feedback.text}" }

    describe "#name" do
      subject { feedback.name }

      it { is_expected.to eq(name) }
    end

    describe "#email" do
      subject { feedback.email }

      it { is_expected.to eq(email) }
    end

    describe "#full_name_with_email" do
      subject { feedback.text }

      it { is_expected.to eq(text) }
    end
  end
end
