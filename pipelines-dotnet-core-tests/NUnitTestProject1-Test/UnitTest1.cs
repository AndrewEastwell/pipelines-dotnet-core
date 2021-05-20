using NUnit.Framework;
using pipelines_dotnet_core.Controllers;

namespace NUnitTestProject1_Test
{
    public class Tests
    {
        [SetUp]
        public void Setup()
        {
        }

        [Test]
        public void Test1()
        {

            var sut = new HomeController();

            var result = sut.Index();

            Assert.IsNotNull(result);
            // Assert.Pass();
        }
    }
}