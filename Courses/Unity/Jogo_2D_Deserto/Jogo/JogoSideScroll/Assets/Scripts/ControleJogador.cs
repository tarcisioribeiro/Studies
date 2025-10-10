using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ControleJogador : MonoBehaviour
{

    private Rigidbody2D rig;

    public float speed;
    public float jumpForce;

    public Transform camera;
    public Transform fundo;
    private Animator animator;
    private bool pulando = false;
    private AudioSource somPulo;
    private AudioSource somMoeda;

    void Start()
    {
        rig = GetComponent<Rigidbody2D>();

        //Inicializar a Câmera de acordo com a posição incial do Jogador
        camera.position = new Vector3(rig.transform.position.x + 3, 0, -10);
        animator = GetComponent<Animator>();

        somPulo = GetComponents<AudioSource>()[1];
        somMoeda = GetComponents<AudioSource>()[2];
    }

    void Update()
    {
        float mov = Input.GetAxisRaw("Horizontal");

        //Faz o flip quando o jogador voltar

        if (mov == 1)
        {
            GetComponent<SpriteRenderer>().flipX = false;
            GetComponent<BoxCollider2D>().offset = new Vector2(-0.9451752F, 0.2321641F);
        }
        else if (mov == -1)
        {
            GetComponent<SpriteRenderer>().flipX = true;
            GetComponent<BoxCollider2D>().offset = new Vector2(0.9451752F, 0.2321641F);

        }
        rig.velocity = new Vector2(mov * speed, rig.velocity.y);
        animator.SetFloat("velocidade", Mathf.Abs(mov));

        if (Input.GetKeyDown(KeyCode.Space) && pulando == false)
        {
            rig.AddForce(Vector2.up * jumpForce, ForceMode2D.Impulse);
            animator.SetBool("pulando", true);
            pulando = true;
            somPulo.Play();
        }

        //Posiciona a câmera
        float camx = rig.transform.position.x + 3;
        if (camx < 0)
        {
            camx = 0;
        }
        if (camx > 80)
        {
            camx = 80;
        }

        float camy = rig.transform.position.y - 0.6F;
        if (camy < -0.05)
        {
            camy = -0.05F;
        }
        else if (camy > 9.15F)
        {
            camy = 8.15F;
        }
        camera.position = new Vector3(camx, camy, -10);

        float fundox = (((camx - -5.6F) / 1.5F) + 43);
        fundo.position = new Vector3(fundox, 4F, 0F);
    }
    void OnCollisionEnter2D(Collision2D col)
    {
        animator.SetBool("pulando", false);
        pulando = false;
    }

    void OnTriggerEnter2D(Collider2D col) {
        if (col.gameObject.tag == "Coin") {
            Destroy(col.gameObject);
            somMoeda.Play();
        }
    }
}
