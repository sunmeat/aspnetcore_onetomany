using Microsoft.EntityFrameworkCore;
using Soccer.Contexts;

namespace Soccer
{
    public class Program
    {
        public static void Main()
        {
            var builder = WebApplication.CreateBuilder();

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