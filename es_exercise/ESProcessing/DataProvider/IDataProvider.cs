using System.Data;

namespace DataProvider
{
    public interface IDataProvider
    {
        DataTable GetDatas();
    }
}
