package newsaggregator.entity;

import org.hibernate.validator.constraints.URL;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.util.List;

@Entity
public class Site {
    @Id
    @GeneratedValue
    private Integer id;

    @Size(min = 1, message = "Invalid URL!")
    @URL(message = "Invalid URL!")
    @Column(length = 1000)
    private String url;

    @Size(min = 1, message = "Name must be at least 1 character!")
    private String name;

    @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
    @JoinColumn(name = "parse_rule_id")
    private ParseRule parseRule;

    @OneToMany(mappedBy = "site", cascade = CascadeType.MERGE)
    private List<Item> items;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public ParseRule getParseRule() {
        return parseRule;
    }

    public void setParseRule(ParseRule parseRule) {
        this.parseRule = parseRule;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }
}
