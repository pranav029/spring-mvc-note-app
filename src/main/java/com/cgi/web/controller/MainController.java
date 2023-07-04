package com.cgi.web.controller;

import com.cgi.web.entities.Note;
import com.cgi.web.services.NoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.transaction.Transactional;
import java.util.List;

@Controller
public class MainController {

    @Autowired
    private NoteService noteService;

    @RequestMapping("/home")
    @Transactional
    public ModelAndView mainPage() {
        List<Note> notes = noteService.getAllNotes();
        ModelAndView modelAndView = new ModelAndView("index", "command", new Note());
        modelAndView.addObject("notes", notes);
        return modelAndView;
    }

    @RequestMapping(value = "/form", method = RequestMethod.GET)
    public ModelAndView openForm() {
        return new ModelAndView("form", "command", new Note());
    }

    @RequestMapping(value = "/addNote", method = RequestMethod.POST)
    public String submit(@ModelAttribute("note") Note note, ModelMap modelMap) {
        System.out.println("Adding" + note);
        noteService.addNote(note);
        return "redirect:home";
    }

    @RequestMapping(value = "/deleteNote", method = RequestMethod.POST)
    public String delete(@ModelAttribute("delete") Note note, ModelMap modelMap) {
        System.out.println("Deleting... " + note);
        noteService.deleteNote(note);
        return "redirect:home";
    }
}
