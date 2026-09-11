using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Soccer.Contexts;
using Soccer.Models;

namespace Soccer.Controllers
{
    public class PlayersController : Controller
    {
        private readonly SoccerContext _context;

        public PlayersController(SoccerContext context)
        {
            _context = context;
        }

        // GET: Player
        public async Task<IActionResult> Index()
        {
            var soccerContext = _context.Player.Include(p => p.Team);
            return View(await soccerContext.ToListAsync());
        }

        // GET: Player/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Player == null)
            {
                return NotFound();
            }

            var players = await _context.Player
                .Include(p => p.Team)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (players == null)
            {
                return NotFound();
            }

            return View(players);
        }

        // GET: Player/Create
        public IActionResult Create()
        {
            ViewData["TeamId"] = new SelectList(_context.Team, "Id", "Name"); // на вью передається команда гравця
            return View();
        }

        // POST: Player/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Name,Age,Position,TeamId")] Player players)
        {
            try
            {
                _context.Add(players);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            catch (Exception)
            {
                return RedirectToAction(nameof(Index));
            }
          
        }

        // GET: Player/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Player == null)
            {
                return NotFound();
            }

            var players = await _context.Player.FindAsync(id);
            if (players == null)
            {
                return NotFound();
            }
            // редагування гравця показує команду, в якій він грає, в списку треба обрати відповідний пункт
            ViewData["TeamId"] = new SelectList(_context.Team, "Id", "Name", players.TeamId);
            return View(players);
        }

        // POST: Player/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,Name,Age,Position,TeamId")] Player players)
        {
            if (id != players.Id)
            {
                return NotFound();
            }

            try
            {
                _context.Update(players);
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PlayerExists(players.Id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }
            return RedirectToAction(nameof(Index));

        }

        // GET: Player/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Player == null)
            {
                return NotFound();
            }

            var players = await _context.Player
                .Include(p => p.Team)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (players == null)
            {
                return NotFound();
            }

            return View(players);
        }

        // POST: Player/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Player == null)
            {
                return Problem("Entity set 'SoccerContext.Player'  is null.");
            }
            var players = await _context.Player.FindAsync(id);
            if (players != null)
            {
                _context.Player.Remove(players);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool PlayerExists(int id)
        {
          return (_context.Player?.Any(e => e.Id == id)).GetValueOrDefault();
        }
    }
}
