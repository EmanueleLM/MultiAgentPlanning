(define (domain child-snack)
  (:requirements :strips :typing :negative-preconditions :equality)
  (:types agent chef server child sandwich location)

  (:predicates
    (at ?a - agent ?l - location)
    (tray_at ?l - location)
    (made ?s - sandwich)
    (on_tray ?s - sandwich)
    (sand_is_no_gluten ?s - sandwich)
    (child_needs_no_gluten ?c - child)
    (intended_for ?s - sandwich ?c - child)
    (served ?s - child)
    (assembly_done)
  )

  ;; Chef makes a gluten-free sandwich for a specific intended child
  (:action make_sandwich_no_gluten
    :parameters (?chef - chef ?s - sandwich ?c - child)
    :precondition (and
                    (at ?chef kitchen)
                    (intended_for ?s ?c)
                    (not (made ?s))
                  )
    :effect (and
              (made ?s)
              (sand_is_no_gluten ?s)
            )
  )

  ;; Chef makes a regular sandwich (not necessarily marked gluten-free)
  (:action make_sandwich
    :parameters (?chef - chef ?s - sandwich ?c - child)
    :precondition (and
                    (at ?chef kitchen)
                    (intended_for ?s ?c)
                    (not (made ?s))
                  )
    :effect (and
              (made ?s)
              ;; explicitly ensure sandwich is not marked gluten-free after this action
              (not (sand_is_no_gluten ?s))
            )
  )

  ;; Chef places a made sandwich onto the tray (tray must be in the kitchen)
  (:action put_on_tray
    :parameters (?chef - chef ?s - sandwich)
    :precondition (and
                    (at ?chef kitchen)
                    (made ?s)
                    (tray_at kitchen)
                    (not (on_tray ?s))
                  )
    :effect (and
              (on_tray ?s)
            )
  )

  ;; Finalize assembly: chef signals assembly is complete only when all sandwiches (exactly the 8 in this task)
  ;; This action is intentionally explicit about the 8 sandwich parameters so the solver must bind all distinct sandwiches
  (:action finalize_assembly
    :parameters (?chef - chef
                 ?s1 - sandwich ?s2 - sandwich ?s3 - sandwich ?s4 - sandwich
                 ?s5 - sandwich ?s6 - sandwich ?s7 - sandwich ?s8 - sandwich)
    :precondition (and
                    (at ?chef kitchen)
                    (on_tray ?s1) (on_tray ?s2) (on_tray ?s3) (on_tray ?s4)
                    (on_tray ?s5) (on_tray ?s6) (on_tray ?s7) (on_tray ?s8)
                    ;; enforce that all parameters are distinct sandwich objects
                    (not (= ?s1 ?s2)) (not (= ?s1 ?s3)) (not (= ?s1 ?s4)) (not (= ?s1 ?s5))
                    (not (= ?s1 ?s6)) (not (= ?s1 ?s7)) (not (= ?s1 ?s8))
                    (not (= ?s2 ?s3)) (not (= ?s2 ?s4)) (not (= ?s2 ?s5)) (not (= ?s2 ?s6))
                    (not (= ?s2 ?s7)) (not (= ?s2 ?s8))
                    (not (= ?s3 ?s4)) (not (= ?s3 ?s5)) (not (= ?s3 ?s6)) (not (= ?s3 ?s7))
                    (not (= ?s3 ?s8))
                    (not (= ?s4 ?s5)) (not (= ?s4 ?s6)) (not (= ?s4 ?s7)) (not (= ?s4 ?s8))
                    (not (= ?s5 ?s6)) (not (= ?s5 ?s7)) (not (= ?s5 ?s8))
                    (not (= ?s6 ?s7)) (not (= ?s6 ?s8))
                    (not (= ?s7 ?s8))
                  )
    :effect (and
              (assembly_done)
            )
  )

  ;; Server moves the tray from kitchen to dining_table, but only after assembly has been finalized
  (:action move_tray
    :parameters (?server - server)
    :precondition (and
                    (at ?server kitchen)
                    (tray_at kitchen)
                    (assembly_done)
                  )
    :effect (and
              (tray_at dining_table)
              (not (tray_at kitchen))
              (at ?server dining_table)
              (not (at ?server kitchen))
            )
  )

  ;; Serve a gluten-free sandwich: only allowed for children who need no-gluten sandwiches
  (:action serve_sandwich_no_gluten
    :parameters (?server - server ?s - sandwich ?c - child)
    :precondition (and
                    (at ?server dining_table)
                    (tray_at dining_table)
                    (on_tray ?s)
                    (intended_for ?s ?c)
                    (child_needs_no_gluten ?c)
                    (sand_is_no_gluten ?s)
                    (not (served ?s ?c))
                  )
    :effect (and
              (served ?s ?c)
              (not (on_tray ?s))
            )
  )

  ;; Serve a sandwich for children who do not require gluten-free sandwiches
  ;; This action may serve any sandwich intended for a non-gluten-restricted child
  (:action serve_sandwich
    :parameters (?server - server ?s - sandwich ?c - child)
    :precondition (and
                    (at ?server dining_table)
                    (tray_at dining_table)
                    (on_tray ?s)
                    (intended_for ?s ?c)
                    (not (child_needs_no_gluten ?c))
                    (not (served ?s ?c))
                  )
    :effect (and
              (served ?s ?c)
              (not (on_tray ?s))
            )
  )

)