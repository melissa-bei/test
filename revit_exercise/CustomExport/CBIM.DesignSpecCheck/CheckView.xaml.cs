using System.Windows;
using System.Windows.Controls;

namespace CBIM.DesignSpecCheck
{
    /// <summary>
    /// CheckView.xaml 的交互逻辑
    /// </summary>
    public partial class CheckView : Window
    {
        public CheckView()
        {
            InitializeComponent();
        }

        private void Ok_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void Cancel_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void CheckBox_Click(object sender, RoutedEventArgs e)
        {
            var checkBox = sender as CheckBox;
            var typeStr = checkBox.CommandParameter.ToString();
            var vm = this.DataContext as SpecModelCheck;

            this.Table.SelectedIndex = -1;
            if (typeStr == "HideEqual")
            {
                vm.AddOrDelEqualItems((bool)checkBox.IsChecked);
            }
            else if (typeStr == "HideNullValue")
            {
                vm.AddOrDelNullItems((bool)checkBox.IsChecked);
            }
        }

        private void Table_SelectedCellsChanged(object sender, SelectedCellsChangedEventArgs e)
        {
            var vm = this.DataContext as SpecModelCheck;
            vm.HightlightSelectedItem(this.Table.SelectedItem as CheckReltData);
        }
    }
}
