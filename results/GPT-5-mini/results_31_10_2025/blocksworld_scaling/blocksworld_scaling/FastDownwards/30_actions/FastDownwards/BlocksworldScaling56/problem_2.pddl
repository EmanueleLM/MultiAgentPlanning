(define (problem blocks-vc-problem)
  (:domain blocks-vowel-consonant)

  (:objects
    a e i - vowel
    b c d f g h j k l m n - consonant
  )

  (:init
    ; initial "on" relations (immediate supports)
    ; Stack 1 bottom-to-top: h b d k j
    (on b h)
    (on d b)
    (on k d)
    (on j k)

    ; Stack 2 bottom-to-top: i l c
    (on l i)
    (on c l)

    ; Stack 3 bottom-to-top: e n a
    (on n e)
    (on a n)

    ; Stack 4 bottom-to-top: m f g
    (on f m)
    (on g f)

    ; which blocks are directly on the table (bottom elements)
    (ontable h)
    (ontable i)
    (ontable e)
    (ontable m)

    ; clear/top facts for blocks that are currently exposed (no block above)
    (clear j)
    (clear c)
    (clear a)
    (clear g)
  )

  (:goal (and
    ; Desired final tower, bottom n on the table then m,l,k,j,i,h,g,f,e,d,c,b,a above in that order
    (ontable n)
    (on m n)
    (on l m)
    (on k l)
    (on j k)
    (on i j)
    (on h i)
    (on g h)
    (on f g)
    (on e f)
    (on d e)
    (on c d)
    (on b c)
    (on a b)
  ))
)