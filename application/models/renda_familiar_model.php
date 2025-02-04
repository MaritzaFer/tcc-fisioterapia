<?php
 
class renda_familiar_model extends CI_Model {
 
    function __construct() {
        parent::__construct();
    }
 
    function inserir($data) {
        return $this->db->insert('tb_renda_familiar', $data);
    }
 
    function listar() {
        $query = $this->db->get('tb_renda_familiar');
        return $query->result();
    }
    function editar($codigo_renda) {
    $this->db->where('codigo_renda', $codigo_renda);
    $query = $this->db->get('tb_renda_familiar');
    return $query->result();
    }
     
    function atualizar($data) {
        $this->db->where('codigo_renda', $data['codigo_renda']);
        $this->db->set($data);
        return $this->db->update('tb_renda_familiar');
    }
     
    function deletar($codigo_renda) {
        $this->db->where('codigo_renda', $codigo_renda);
        return $this->db->delete('tb_renda_familiar');
    }
}