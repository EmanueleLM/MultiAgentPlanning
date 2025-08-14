(define (problem blocks-unstacked)
  (:domain blocks-world)

  ;; ------------------------------------------------------------------
  ;; Objects
  ;; ------------------------------------------------------------------
  (:objects
    A B C D E - block
  )

  ;; ------------------------------------------------------------------
  ;; Initial state
  ;; ------------------------------------------------------------------
  (:init
    ;; Table positions
    (ontable A) (ontable B) (ontable C) (ontable D) (ontable E)

    ;; All blocks start clear
    (clear A) (clear B) (clear C) (clear D) (clear E)

    ;; The hand is empty
    (handempty)
  )

  ;; ------------------------------------------------------------------
  ;; Goal
  ;; ------------------------------------------------------------------
  (:goal (and
           ;; D must sit on the table
           (ontable D)

           ;; The vertical stack must be D‑A‑B‑C‑E
           (on A D)
           (on B A)
           (on C B)
           (on E C)

           ;; E must remain clear
           (clear E)
         ))
)