using Microsoft.EntityFrameworkCore;
using Soccer.Models;
// dotnet add package Microsoft.EntityFrameworkCore !!! встановлюємо пакети, інакше код не працюватиме, View > Terminal (або NuGet)
// dotnet add package Microsoft.EntityFrameworkCore.SqlServer !!!

namespace Soccer
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // отримуємо рядок підключення з конфігураційного файлу, там нова база Files!
            string? connection = builder.Configuration.GetConnectionString("DefaultConnection");

            // реєструємо контекст бази даних для роботи з SQL Server (новий контекст)
            builder.Services.AddDbContext<SoccerContext>(options =>
                options.UseSqlServer(connection));
            builder.Services.AddControllersWithViews();
            var app = builder.Build();

            // увімкнення обслуговування статичних файлів з папки wwwroot
            app.UseStaticFiles();
            app.UseStatusCodePagesWithReExecute("/Error404");

            // стандартний маршрут за замовчуванням
            app.MapControllerRoute(
                name: "default",
                pattern: "{controller=Teams}/{action=Index}/{id?}");

            app.Run();
        }
    }
}