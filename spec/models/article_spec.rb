require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'Validaciones base' do
    it 'si el factory es valido' do
      expect(build(:article_1)).to be_valid
    end

    it 'crear' do
      expect { create(:article_1) }.to change(described_class, :count).from(0).to(1)
    end

    it 'eliminar' do
      create(:article_1)
      expect { described_class.last.destroy }.to change(described_class, :count).from(1).to(0)
    end
  end

  describe 'atributos' do
    subject { build(:article_1) }

    it { is_expected.to have_attributes(record_id: 28142765) }
    it { is_expected.to have_attributes(title: 'We migrated ToolJet server from Ruby to Node.js') }
    it { is_expected.to have_attributes(url: 'https://blog.tooljet.io/how-we-migrated-tooljet') }
    it { is_expected.to have_attributes(author: 'navaneethpk') }
    it { is_expected.to have_attributes(points: 4) }
    it { is_expected.to have_attributes(num_comments: 1) }
    it { is_expected.to have_attributes(tag: 'story') }
  end

  describe 'validaciones' do
    subject { build(:article_1) }

    it { is_expected.to validate_presence_of(:publish_date) }
    it { is_expected.to validate_uniqueness_of(:record_id) }
    it { is_expected.to validate_presence_of(:record_id) }
    it { is_expected.to validate_presence_of(:tag) }
  end

  describe 'scopes y metodos' do
    let!(:article_1) { create(:article_1) }
    let!(:article_2) { create(:article_2) }
    let!(:article_3) { create(:article_3) }

    describe '.stories' do
      it 'se obtienen los registros cuyo tag sea story' do
        expect(described_class.stories).to contain_exactly(article_1, article_2)
      end
    end

    describe '.comments' do
      it 'se obtienen los registros cuyo tag sea comment' do
        expect(described_class.comments).to contain_exactly(article_3)
      end
    end

    describe '.from_date' do
      it 'se obtienen los registros cuyo fecha sea la enviada en como argumento' do
        expect(described_class.from_date('2021-08-11')).to contain_exactly(article_2)
      end
    end

    describe '.by_parent' do
      it 'se obtienen los registros cuyo parent_id sea el enviado como argumento' do
        expect(described_class.by_parent(28142765)).to contain_exactly(article_3)
      end
    end

    describe '.search' do
      it 'se obtienen los registros cuyo title o story_title contenga el texto de busqueda' do
        expect(described_class.search('Story title example')).to contain_exactly(article_3)
      end
    end

    describe '#children' do
      it 'se obtienen los registros que hijos' do
        expect(article_1.children).to contain_exactly(article_3)
      end
    end
  end
end
