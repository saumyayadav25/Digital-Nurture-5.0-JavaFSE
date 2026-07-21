## Difference between JPA, Hibernate, and Spring Data JPA

#### 1. Java Persistence API (JPA)

- **JPA (Java Persistence API)** is a **Java specification (JSR 338)** for persisting, retrieving, updating, and deleting data from a database using Java objects.
- It defines **rules and interfaces** for Object Relational Mapping (ORM).
- **JPA itself does not provide an implementation.**
- It requires an implementation such as **Hibernate**, EclipseLink, or OpenJPA.

**Example**

```java
@Entity
public class Employee {

    @Id
    private int id;

    private String name;
}
```

Here, annotations like `@Entity` and `@Id` are defined by JPA.

---

#### 2. Hibernate

- **Hibernate** is an **ORM (Object Relational Mapping) framework**.
- It is one of the most popular **implementations of JPA**.
- Hibernate provides the actual logic for mapping Java objects to database tables.
- It also offers additional features beyond the JPA specification.

**Responsibilities**

- Implements JPA
- Generates SQL queries
- Manages sessions
- Handles transactions
- Maps Java objects to database tables

**Example**

```java
public Integer addEmployee(Employee employee) {

    Session session = factory.openSession();
    Transaction tx = null;
    Integer employeeID = null;

    try {
        tx = session.beginTransaction();

        employeeID = (Integer) session.save(employee);

        tx.commit();

    } catch (HibernateException e) {

        if (tx != null)
            tx.rollback();

        e.printStackTrace();

    } finally {

        session.close();
    }

    return employeeID;
}
```

Notice that the developer manually manages:

- Session
- Transaction
- Commit
- Rollback
- Closing the session

This results in more boilerplate code.

---

#### 3. Spring Data JPA

- **Spring Data JPA** is **not a JPA implementation**.
- It is a **Spring module** built on top of JPA.
- It works with a JPA implementation such as Hibernate.
- It reduces boilerplate code by providing ready-made repository interfaces.

**Responsibilities**

- Simplifies database operations
- Generates CRUD methods automatically
- Reduces boilerplate code
- Integrates with the Spring Framework
- Manages transactions using annotations

**Repository**

```java
public interface EmployeeRepository
        extends JpaRepository<Employee, Integer> {

}
```

**Service**

```java
@Service
public class EmployeeService {

    @Autowired
    private EmployeeRepository employeeRepository;

    @Transactional
    public void addEmployee(Employee employee) {

        employeeRepository.save(employee);

    }
}
```

Notice that there is **no session management, transaction handling, or SQL writing**. Spring Data JPA handles these internally.

---

### Relationship

```text
Spring Data JPA
        │
        ▼
      JPA
        │
        ▼
Hibernate (Implementation)
        │
        ▼
Database
```

---

### Comparison

| Feature | JPA | Hibernate | Spring Data JPA |
|---------|-----|-----------|-----------------|
| **Type** | Specification | ORM Framework | Spring Module |
| **Implementation** | ❌ No | ✅ Yes | ❌ No |
| **ORM Support** | Defines ORM rules | Implements ORM | Uses JPA implementation |
| **Boilerplate Code** | Moderate | High | Very Low |
| **Transaction Management** | No | Manual | Via Spring (`@Transactional`) |
| **CRUD Methods** | No | Manual | Automatic (`save()`, `findAll()`, `delete()`, etc.) |
| **Dependency** | Requires an implementation | Can work independently or as a JPA provider | Requires a JPA implementation (e.g., Hibernate) |

#### Conclusion

> **JPA** is a specification that defines how Java objects should be mapped to database tables, but it does not provide an implementation. **Hibernate** is a popular ORM framework that implements JPA and performs the actual database operations. **Spring Data JPA** is a Spring module built on top of JPA that simplifies database access by providing repository interfaces and automatic CRUD operations, significantly reducing boilerplate code.

### Summary

- **JPA** defines *what* an ORM framework should do.
- **Hibernate** provides the actual implementation of JPA.
- **Spring Data JPA** sits on top of Hibernate (or another JPA provider) and simplifies database operations by reducing boilerplate code.