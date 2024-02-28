package com.example.mopa_app.ui.after

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.fragment.app.Fragment
import androidx.lifecycle.ViewModelProvider
import com.example.mopa_app.databinding.FragmentAfterBinding

class AfterFragment : Fragment() {

    private var _binding: FragmentAfterBinding? = null

    // This property is only valid between onCreateView and
    // onDestroyView.
    private val binding get() = _binding!!

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        val afterViewModel =
            ViewModelProvider(this).get(AfterViewModel::class.java)

        _binding = FragmentAfterBinding.inflate(inflater, container, false)
        val root: View = binding.root

        val textView: TextView = binding.textAfter
        afterViewModel.text.observe(viewLifecycleOwner) {
            textView.text = it
        }
        return root
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }
}