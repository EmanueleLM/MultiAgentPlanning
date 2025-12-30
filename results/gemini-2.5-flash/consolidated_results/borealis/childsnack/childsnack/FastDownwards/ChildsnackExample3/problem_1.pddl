(define (problem ChildsnackExample3)
  (:domain childsnack)
  (:objects
    C1 C2 C3 C4 C5 C6 C7 C8 - child
    S1 S2 S3 S4 S5 S6 S7 S8 - sandwich
  )
  (:init
    (= (total-cost) 0)

    ; Child properties (C1-C4 are allergic)
    (is_allergic C1)
    (is_allergic C2)
    (is_allergic C3)
    (is_allergic C4)

    ; Sandwich properties (S1-S4 are GF)
    (is_gf S1)
    (is_gf S2)
    (is_gf S3)
    (is_gf S4)

    ; Define safe_to_serve constraints:
    ; Allergic children (C1-C4) can only eat GF sandwiches (S1-S4)
    (safe_to_serve C1 S1) (safe_to_serve C1 S2) (safe_to_serve C1 S3) (safe_to_serve C1 S4)
    (safe_to_serve C2 S1) (safe_to_serve C2 S2) (safe_to_serve C2 S3) (safe_to_serve C2 S4)
    (safe_to_serve C3 S1) (safe_to_serve C3 S2) (safe_to_serve C3 S3) (safe_to_serve C3 S4)
    (safe_to_serve C4 S1) (safe_to_serve C4 S2) (safe_to_serve C4 S3) (safe_to_serve C4 S4)

    ; Non-allergic children (C5-C8) can eat any sandwich (S1-S8)
    (safe_to_serve C5 S1) (safe_to_serve C5 S2) (safe_to_serve C5 S3) (safe_to_serve C5 S4)
    (safe_to_serve C6 S1) (safe_to_serve C6 S2) (safe_to_serve C6 S3) (safe_to_serve C6 S4)
    (safe_to_serve C7 S1) (safe_to_serve C7 S2) (safe_to_serve C7 S3) (safe_to_serve C7 S4)
    (safe_to_serve C8 S1) (safe_to_serve C8 S2) (safe_to_serve C8 S3) (safe_to_serve C8 S4)
    
    (safe_to_serve C5 S5) (safe_to_serve C5 S6) (safe_to_serve C5 S7) (safe_to_serve C5 S8)
    (safe_to_serve C6 S5) (safe_to_serve C6 S6) (safe_to_serve C6 S7) (safe_to_serve C6 S8)
    (safe_to_serve C7 S5) (safe_to_serve C7 S6) (safe_to_serve C7 S7) (safe_to_serve C7 S8)
    (safe_to_serve C8 S5) (safe_to_serve C8 S6) (safe_to_serve C8 S7) (safe_to_serve C8 S8)
  )
  (:goal (and 
    (child_served C1)
    (child_served C2)
    (child_served C3)
    (child_served C4)
    (child_served C5)
    (child_served C6)
    (child_served C7)
    (child_served C8)
  ))
  (:metric minimize (total-cost))
)