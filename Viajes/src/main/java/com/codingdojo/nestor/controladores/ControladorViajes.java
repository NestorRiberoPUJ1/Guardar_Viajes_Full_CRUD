package com.codingdojo.nestor.controladores;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.codingdojo.nestor.modelos.Gasto;
import com.codingdojo.nestor.servicios.ServicioViajes;

@Controller
@RequestMapping("/expenses")
public class ControladorViajes {

	private final ServicioViajes servicio;

	public ControladorViajes(ServicioViajes servicio) {
		this.servicio = servicio;
	}

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String index(Model model) {
		List<Gasto> listaDeGastos = servicio.get_gastos();

		model.addAttribute("lista_gastos", listaDeGastos);

		return "index.jsp";
	}

	@RequestMapping(value = "new", method = RequestMethod.GET)
	public String newExpense(@ModelAttribute("gasto") Gasto gasto) {
		return "new.jsp";
	}

	@PostMapping("/create")
	public String create(@Valid @ModelAttribute("gasto") Gasto gasto, BindingResult result) {
		if (result.hasErrors()) {
			return "new.jsp";
		} else {
			servicio.save_gasto(gasto);
			return "redirect:/expenses";
		}
	}

	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public String editGasto(Model model, @PathVariable(value = "id") Long id) {
		Gasto editGasto = servicio.find_gasto(id);

		model.addAttribute("gasto", editGasto);

		return "edit.jsp";
	}

	@PutMapping(value = "/edit/{id}")
	public String update(@Valid @ModelAttribute("gasto") Gasto gasto, BindingResult result) {
		if (result.hasErrors()) {
			return "edit.jsp";
		} else {
			servicio.save_gasto(gasto);
			return "redirect:/expenses";
		}
	}

	@DeleteMapping(value = "/delete/{id}")
	public String delete(@PathVariable(value = "id") Long id) {
		servicio.delete_gasto(id);
		return "redirect:/expenses";
	}

	@GetMapping(value = "{id}")
	public String view(Model model, @PathVariable(value = "id") Long id) {
		Gasto viewGasto = servicio.find_gasto(id);
		model.addAttribute("gasto", viewGasto);

		return "view.jsp";
	}

}
