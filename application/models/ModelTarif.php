<?php 
	class ModelTarif extends CI_Model
	{
		function __construct()
		{
			parent::__construct();
		}
		public function all($tb,$prop)
		{
			return $this->db->query("SELECT * FROM $tb $prop");
		}
		public function views($tb)
		{
			return $this->db->get($tb);
		}
		public function simpan($val)
		{
			return $this->db->insert("tb_tarif_penerbangan",$val);
		}
		public function edit($id,$val)
		{
			$this->db->where("id_tarif",$id);
			return $this->db->update("tb_tarif_penerbangan",$val);
		}
		public function hapus($id)
		{
			$this->db->where("id_tarif",$id);
			return $this->db->delete("tb_tarif_penerbangan");
		}
		public function id()
		{
			return $this->db->query("SELECT max(id_tarif) as no FROM tb_tarif_penerbangan");
		}
		public function penerbangan()
		{
			return $this->db->query("
					SELECT id_penerbangan,tgl_penerbangan,asal,tujuan,jam_berangkat,jam_tiba,(tb_bandara.nama) as bandara, (tb_pesawat.tipe_pesawat) as pesawat
					FROM tb_penerbangan
					INNER JOIN tb_bandara ON tb_penerbangan.id_bandara=tb_bandara.id_bandara
					INNER JOIN tb_pesawat ON tb_penerbangan.id_pesawat=tb_pesawat.id_pesawat
				");
		}
	}
 ?>