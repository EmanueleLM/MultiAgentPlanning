(define (problem sandwich-problem)
  (:domain sandwich-domain)

  (:objects
    ;; locations
    kitchen - location

    ;; tables (tables are subtype of location)
    table1 table2 table3 table4 - table

    ;; trays
    tray1 tray2 tray3 - tray

    ;; bread portions
    bread1 bread2 bread3 bread4 bread5 bread6 bread7 bread8 bread9 bread10 bread11 bread12 - bread_portion

    ;; content portions
    content1 content2 content3 content4 content5 content6 content7 content8 content9 content10 content11 content12 - content_portion

    ;; sandwich placeholders (provided constants s1..s16)
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - sandwich_placeholder

    ;; children
    child1 child2 child3 child4 child5 child6 child7 child8 child9 child10 child11 child12 - child
  )

  (:init
    ;; All trays start at the kitchen
    (tray_at tray1 kitchen)
    (tray_at tray2 kitchen)
    (tray_at tray3 kitchen)

    ;; All bread portions are available
    (bread_available bread1)
    (bread_available bread2)
    (bread_available bread3)
    (bread_available bread4)
    (bread_available bread5)
    (bread_available bread6)
    (bread_available bread7)
    (bread_available bread8)
    (bread_available bread9)
    (bread_available bread10)
    (bread_available bread11)
    (bread_available bread12)

    ;; All content portions are available
    (content_available content1)
    (content_available content2)
    (content_available content3)
    (content_available content4)
    (content_available content5)
    (content_available content6)
    (content_available content7)
    (content_available content8)
    (content_available content9)
    (content_available content10)
    (content_available content11)
    (content_available content12)

    ;; Mark which breads are gluten-free (breads 1-6)
    (bread_gluten_free bread1)
    (bread_gluten_free bread2)
    (bread_gluten_free bread3)
    (bread_gluten_free bread4)
    (bread_gluten_free bread5)
    (bread_gluten_free bread6)

    ;; Mark which contents are gluten-free (contents 1-6)
    (content_gluten_free content1)
    (content_gluten_free content2)
    (content_gluten_free content3)
    (content_gluten_free content4)
    (content_gluten_free content5)
    (content_gluten_free content6)

    ;; Children and where they wait (3 per table)
    (child_at child1 table1)
    (child_at child2 table1)
    (child_at child3 table1)

    (child_at child4 table2)
    (child_at child5 table2)
    (child_at child6 table2)

    (child_at child7 table3)
    (child_at child8 table3)
    (child_at child9 table3)

    (child_at child10 table4)
    (child_at child11 table4)
    (child_at child12 table4)

    ;; Children allergic to gluten (must receive gluten-free sandwich)
    (child_allergic_gluten child2)
    (child_allergic_gluten child5)
    (child_allergic_gluten child8)
    (child_allergic_gluten child11)

    ;; No (child_served ...) facts are asserted initially: absence means not served.
    ;; No sandwiches exist initially: absence of (sandwich_exists sX) represents that.
  )

  (:goal
    (and
      (child_served child1)
      (child_served child2)
      (child_served child3)
      (child_served child4)
      (child_served child5)
      (child_served child6)
      (child_served child7)
      (child_served child8)
      (child_served child9)
      (child_served child10)
      (child_served child11)
      (child_served child12)
    )
  )
)