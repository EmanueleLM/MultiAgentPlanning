(define (problem scenario1)
  (:domain orchestrated-collection)

  (:objects
    alice - human
    toby - cat
    ball coin vase1 - obj
    rough smooth - texture
    p1 p2 p3 - phase
  )

  (:init
    ; Phase ordering and starting phase
    (next p1 p2)
    (next p2 p3)
    (spring p1)

    ; Cat is present in no phase initially (toby not present in any phase)
    ; (no cats facts set)

    ; Textures
    (texture ball rough)
    (texture coin smooth)
    (texture vase1 smooth)

    ; Vase identity
    (vase vase1)

    ; No initial collections, no hands, no sneezes, no stupendous
  )

  ; Goals: alice must collect ball and coin, be declared stupendous,
  ; and no sneeze may occur in any of the phases (hard constraint).
  (:goal (and
    (collect alice ball)
    (collect alice coin)
    (stupendous alice)
    (not (sneeze p1))
    (not (sneeze p2))
    (not (sneeze p3))
  ))
)