module Guard
  class Skim

    # The inspector verifies of the changed paths are valid
    # for Guard::Skim.
    #
    module Inspector
      class << self

        # Clean the changed paths and return only valid
        # Skim files.
        #
        # @param [Array<String>] paths the changed paths
        # @return [Array<String>] the valid spec files
        #
        def clean(paths)
          paths.uniq!
          paths.compact!
          paths = paths.select { |p| skim_file?(p) }
          clear_skim_files_list
          paths
        end

        private

        # Tests if the file is valid.
        #
        # @param [String] file the file
        # @return [Boolean] when the file valid
        #
        def skim_file?(path)
          skim_files.include?(path)
        end

        # Scans the project and keeps a list of all
        # Skim files.
        #
        # @see #clear_skim_files_list
        # @return [Array<String>] the valid files
        #
        def skim_files
          @skim_files ||= Dir.glob('**/*.skim')
        end

        # Clears the list of Skim files in this project.
        #
        def clear_skim_files_list
          @skim_files = nil
        end

      end
    end
  end
end
