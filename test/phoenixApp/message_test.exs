defmodule PhoenixApp.MessageTest do
  use PhoenixApp.DataCase

  alias PhoenixApp.Message

  describe "letters" do
    alias PhoenixApp.Message.Letters

    import PhoenixApp.MessageFixtures

    @invalid_attrs %{body: nil, word_count: nil}

    test "list_letters/0 returns all letters" do
      letters = letters_fixture()
      assert Message.list_letters() == [letters]
    end

    test "get_letters!/1 returns the letters with given id" do
      letters = letters_fixture()
      assert Message.get_letters!(letters.id) == letters
    end

    test "create_letters/1 with valid data creates a letters" do
      valid_attrs = %{body: "some body", word_count: 42}

      assert {:ok, %Letters{} = letters} = Message.create_letters(valid_attrs)
      assert letters.body == "some body"
      assert letters.word_count == 42
    end

    test "create_letters/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Message.create_letters(@invalid_attrs)
    end

    test "update_letters/2 with valid data updates the letters" do
      letters = letters_fixture()
      update_attrs = %{body: "some updated body", word_count: 43}

      assert {:ok, %Letters{} = letters} = Message.update_letters(letters, update_attrs)
      assert letters.body == "some updated body"
      assert letters.word_count == 43
    end

    test "update_letters/2 with invalid data returns error changeset" do
      letters = letters_fixture()
      assert {:error, %Ecto.Changeset{}} = Message.update_letters(letters, @invalid_attrs)
      assert letters == Message.get_letters!(letters.id)
    end

    test "delete_letters/1 deletes the letters" do
      letters = letters_fixture()
      assert {:ok, %Letters{}} = Message.delete_letters(letters)
      assert_raise Ecto.NoResultsError, fn -> Message.get_letters!(letters.id) end
    end

    test "change_letters/1 returns a letters changeset" do
      letters = letters_fixture()
      assert %Ecto.Changeset{} = Message.change_letters(letters)
    end
  end
end
